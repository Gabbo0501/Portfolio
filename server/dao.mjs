import sqlite3 from 'sqlite3';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';
import fs from 'fs';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const dbPath = join(__dirname, 'database/portfolio.db');

const dbDir = dirname(dbPath);
if (!fs.existsSync(dbDir)) {
  fs.mkdirSync(dbDir, { recursive: true });
}

// Check if schema.sql is newer than database file and delete if needed
const schemaPath = join(__dirname, 'database/schema.sql');

const shouldRecreate = () => {
  if (!fs.existsSync(dbPath)) return false; // Let normal initialization handle new DB
  if (!fs.existsSync(schemaPath)) return false;
  
  const dbStats = fs.statSync(dbPath);
  const schemaStats = fs.statSync(schemaPath);
  
  return schemaStats.mtime > dbStats.mtime;
};

if (shouldRecreate()) {
  console.log('Schema is newer than database. Deleting old database...');
  fs.unlinkSync(dbPath);
}

const db = new sqlite3.Database(dbPath, (err) => {
  if (err) throw err;
  
  // Normal initialization for new or empty database
  db.get("SELECT count(*) as count FROM sqlite_master WHERE type='table'", [], (err, row) => {
    if (err) return;
    
    if (row.count === 0) {
      console.log('Initializing database with schema...');
      const schema = fs.readFileSync(schemaPath, 'utf8');
      db.exec(schema, (err) => {
        if (err) console.error('Error initializing database:', err);
        else console.log('Database initialized successfully.');
      });
    }
  });
});

export function getPersonalInfo(language = 'it') {
  return new Promise((resolve, reject) => {
    db.get(`
      SELECT name, bio, email, phone, location 
      FROM personal_info 
      WHERE language = ?
    `, [language], (err, row) => {
      if (err) return reject(err);
      resolve(row);
    });
  });
}

export function getEducation(language = 'it') {
  return new Promise((resolve, reject) => {
    db.all(`
      SELECT degree, institution, description, start_year, end_year, gpa
      FROM education 
      WHERE language = ? 
      ORDER BY start_year DESC
    `, [language], (err, rows) => {
      if (err) return reject(err);
      resolve(rows);
    });
  });
}

export function getFeaturedCourses(language = 'it') {
  return new Promise((resolve, reject) => {
    db.all(`
      SELECT c.course_code, c.name, c.description, c.semester, c.year, c.credits, c.grade, c.url
      FROM courses c
      WHERE c.language = ? AND c.is_featured = TRUE
      ORDER BY c.year DESC, c.semester
    `, [language], (err, courses) => {
      if (err) return reject(err);
      
      let completed = 0;
      const coursesWithTopics = [];
      
      if (courses.length === 0) return resolve([]);
      
      courses.forEach((course, index) => {
        db.all(`
          SELECT topic 
          FROM course_topics 
          WHERE course_code = ? AND language = ?
        `, [course.course_code, language], (err, topics) => {
          if (err) return reject(err);
          
          coursesWithTopics[index] = {
            ...course,
            code: course.course_code,
            topics: topics.map(t => t.topic)
          };
          
          completed++;
          if (completed === courses.length) {
            resolve(coursesWithTopics);
          }
        });
      });
    });
  });
}

export function getAllExams(language = 'it') {
  return new Promise((resolve, reject) => {
    db.all(`
      SELECT exam_code, name, degree_type, credits, grade, exam_date, url
      FROM exams 
      WHERE language = ? 
      ORDER BY degree_type DESC, exam_date DESC
    `, [language], (err, exams) => {
      if (err) return reject(err);
      
      const grouped = {
        magistrale: exams.filter(e => e.degree_type === 'magistrale').map(e => ({
          ...e,
          code: e.exam_code,
          date: e.exam_date
        })),
        triennale: exams.filter(e => e.degree_type === 'triennale').map(e => ({
          ...e,
          code: e.exam_code,
          date: e.exam_date
        }))
      };
      
      resolve(grouped);
    });
  });
}

export function getProjects(language = 'it') {
  return new Promise((resolve, reject) => {
    db.all(`
      SELECT p.project_id, p.name, p.description, p.status, p.github_url, p.demo_url
      FROM projects p
      WHERE p.language = ?
      ORDER BY p.created_at DESC
    `, [language], (err, projects) => {
      if (err) return reject(err);
      
      let completed = 0;
      const projectsWithTech = [];
      
      if (projects.length === 0) return resolve([]);
      
      projects.forEach((project, index) => {
        db.all(`
          SELECT technology 
          FROM project_technologies 
          WHERE project_id = ?
        `, [project.project_id], (err, technologies) => {
          if (err) return reject(err);
          
          projectsWithTech[index] = {
            id: index + 1,
            name: project.name,
            description: project.description,
            status: project.status,
            github: project.github_url,
            demo: project.demo_url,
            technologies: technologies.map(t => t.technology)
          };
          
          completed++;
          if (completed === projects.length) {
            resolve(projectsWithTech);
          }
        });
      });
    });
  });
}

export function getSkills(language = 'it') {
  return new Promise((resolve, reject) => {
    db.all(`
      SELECT 
        CASE 
          WHEN ? = 'it' THEN sc.name_it 
          ELSE sc.name_en 
        END as category, 
        s.technology
      FROM skill_categories sc
      JOIN skills s ON sc.category_id = s.category_id
      ORDER BY sc.category_id, s.technology
    `, [language], (err, skillsData) => {
      if (err) return reject(err);
      
      const grouped = {};
      skillsData.forEach(skill => {
        if (!grouped[skill.category]) {
          grouped[skill.category] = [];
        }
        grouped[skill.category].push(skill.technology);
      });

      const result = Object.keys(grouped).map(category => ({
        category,
        technologies: grouped[category]
      }));
      
      resolve(result);
    });
  });
}

export function getCertifications(language = 'it') {
  return new Promise((resolve, reject) => {
    db.all(`
      SELECT name, organization, description, level, date_obtained, expiry_date, credential_id, url
      FROM certifications 
      WHERE language = ? AND is_featured = TRUE
      ORDER BY date_obtained DESC
    `, [language], (err, rows) => {
      if (err) return reject(err);
      resolve(rows || []);
    });
  });
}

export function getPortfolioData(language = 'it') {
  return new Promise((resolve, reject) => {
    let results = {};
    let completed = 0;
    const totalCalls = 7;
    
    function checkComplete() {
      completed++;
      if (completed === totalCalls) {
        resolve(results);
      }
    }
    
    function handleError(err) {
      reject(err);
    }
    
    getPersonalInfo(language)
      .then(data => { results.personalInfo = data; checkComplete(); })
      .catch(handleError);
      
    getEducation(language)
      .then(data => { results.education = data; checkComplete(); })
      .catch(handleError);
      
    getFeaturedCourses(language)
      .then(data => { results.featuredCourses = data; checkComplete(); })
      .catch(handleError);
      
    getAllExams(language)
      .then(data => { results.exams = data; checkComplete(); })
      .catch(handleError);
      
    getProjects(language)
      .then(data => { results.projects = data; checkComplete(); })
      .catch(handleError);
      
    getSkills(language)
      .then(data => { results.skills = data; checkComplete(); })
      .catch(handleError);
      
    getCertifications(language)
      .then(data => { results.certifications = data; checkComplete(); })
      .catch(handleError);
  });
}