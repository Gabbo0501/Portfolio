BEGIN TRANSACTION;

-- ================================
-- Personal info
-- ================================
INSERT OR IGNORE INTO personal_info (language, name, bio, email, phone, location, linkedin, github) VALUES
('it',
  'Mario Rossi',
  'Profilo professionale di esempio utilizzato per popolare il portfolio.',
  'mario.rossi@example.com',
  '+391234567890',
  'Torino, Italia',
  'https://linkedin.com/in/mariorossi',
  'https://github.com/mariorossi'
),
('en',
  'John Doe',
  'Sample professional profile used to populate the portfolio.',
  'john.doe@example.com',
  '+391234567890',
  'Turin, Italy',
  'https://linkedin.com/in/johndoe',
  'https://github.com/johndoe'
);

-- ================================
-- Education
-- ================================
INSERT OR IGNORE INTO education (language, degree, institution, description, start_year, end_year, gpa) VALUES
('it',
  'Laurea Magistrale in Informatica',
  'Università degli Studi di Torino',
  'Percorso focalizzato su sviluppo software e sistemi informativi.',
  2022,
  NULL,
  30
),
('it',
  'Laurea in Informatica',
  'Università degli Studi di Torino',
  'Fondamenti di informatica, algoritmi e basi di dati.',
  2019,
  2022,
  28
),
('it',
  'Diploma di Scuola Superiore',
  'Liceo Scientifico',
  'Indirizzo scientifico con focus su matematica e informatica.',
  2014,
  2019,
  85
),
('en',
  'Master Degree in Computer Science',
  'University of Turin',
  'Program focused on software development and information systems.',
  2022,
  NULL,
  30
),
('en',
  'Bachelor Degree in Computer Science',
  'University of Turin',
  'Fundamentals of computer science, algorithms and databases.',
  2019,
  2022,
  28
),
('en',
  'High School Diploma',
  'Scientific High School',
  'Scientific curriculum with focus on mathematics and computer science.',
  2014,
  2019,
  85
);

-- ================================
-- Skill categories + skills
-- ================================
INSERT OR IGNORE INTO skill_categories (category_id, name_it, name_en) VALUES
('frontend', 'Frontend', 'Frontend'),
('backend', 'Backend', 'Backend'),
('persistency', 'Persistenza', 'Persistency'),
('tools', 'Strumenti', 'Tools'),
('design', 'Design', 'Design'),
('languages', 'Lingue', 'Languages');

INSERT OR IGNORE INTO skills (category_id, technology) VALUES
('frontend', 'HTML'),
('frontend', 'CSS'),
('frontend', 'JavaScript'),
('frontend', 'React'),
('backend', 'Node.js'),
('backend', 'Express'),
('backend', 'Python'),
('backend', 'Java'),
('persistency', 'MySQL'),
('persistency', 'PostgreSQL'),
('persistency', 'MongoDB'),
('tools', 'Git'),
('tools', 'Docker'),
('tools', 'Linux'),
('design', 'Figma'),
('design', 'UX Design'),
('languages', 'Italiano'),
('languages', 'Inglese');

-- ================================
-- Projects
-- ================================
INSERT OR IGNORE INTO projects (project_id, github_url, demo_url, created_at) VALUES
('project-1', 'https://example.com/project1', 'https://example.com/project1', '2025-01-01T00:00:00Z'),
('project-2', 'https://example.com/project2', 'https://example.com/project2', '2025-02-01T00:00:00Z'),
('project-3', 'https://example.com/project3', 'https://example.com/project3', '2025-03-01T00:00:00Z');

INSERT OR IGNORE INTO project_translations (project_id, language, name, description, status) VALUES
('project-1', 'it', 'Progetto 1', 'Applicazione web per la gestione di contenuti.', 'Completato'),
('project-1', 'en', 'Project 1', 'Web application for content management.', 'Completed'),
('project-2', 'it', 'Progetto 2', 'Servizio backend per API REST.', 'In corso'),
('project-2', 'en', 'Project 2', 'Backend service for REST APIs.', 'In progress'),
('project-3', 'it', 'Progetto 3', 'Applicazione full-stack.', 'Completato'),
('project-3', 'en', 'Project 3', 'Full-stack application.', 'Completed');

INSERT OR IGNORE INTO project_technologies (project_id, technology) VALUES
('project-1', 'React'),
('project-1', 'Node.js'),
('project-2', 'Express'),
('project-2', 'PostgreSQL'),
('project-3', 'Docker');

-- ================================
-- Courses
-- ================================
INSERT OR IGNORE INTO courses (course_code, language, name, description, semester, year, credits, grade, url, is_featured) VALUES
('C001', 'it', 'Programmazione', 'Corso introduttivo alla programmazione.', '1°', 2023, 6, '30', 'https://example.com', TRUE),
('C001', 'en', 'Programming', 'Introduction to programming.', '1st', 2023, 6, '30', 'https://example.com', TRUE),
('C002', 'it', 'Basi di Dati', 'Fondamenti di database relazionali.', '2°', 2023, 6, '28', 'https://example.com', TRUE),
('C002', 'en', 'Databases', 'Fundamentals of relational databases.', '2nd', 2023, 6, '28', 'https://example.com', TRUE);

INSERT OR IGNORE INTO course_topics (course_code, language, topic) VALUES
('C001', 'it', 'Variabili'),
('C001', 'it', 'Controllo di flusso'),
('C001', 'en', 'Variables'),
('C001', 'en', 'Control flow'),
('C002', 'it', 'SQL'),
('C002', 'en', 'SQL');

-- ================================
-- Exams
-- ================================
INSERT OR IGNORE INTO exams (exam_code, language, name, degree_type, credits, grade, exam_date, url) VALUES
('C001', 'it', 'Programmazione', 'triennale', 6, '30', '2023-01-15', 'https://example.com'),
('C002', 'it', 'Basi di Dati', 'triennale', 6, '28', '2023-02-20', 'https://example.com'),
('C001', 'en', 'Programming', 'bachelor', 6, '30', '2023-01-15', 'https://example.com'),
('C002', 'en', 'Databases', 'bachelor', 6, '28', '2023-02-20', 'https://example.com');

-- ================================
-- Certifications
-- ================================
INSERT OR IGNORE INTO certifications (certification_id, language, name, organization, description, level, date_obtained, is_featured) VALUES
('cert-1', 'it', 'Certificazione Linguistica', 'Ente Certificatore', 'Certificazione di lingua inglese.', 'B2', '2023-06-01', TRUE),
('cert-1', 'en', 'Language Certification', 'Certification Body', 'English language certification.', 'B2', '2023-06-01', TRUE);

-- ================================
-- Project images
-- ================================
INSERT OR IGNORE INTO project_images (project_id, image_path, alt_text, display_order, is_primary) VALUES
('project-1', 'img1.png', 'Screenshot progetto', 0, TRUE),
('project-2', 'img2.png', 'Screenshot progetto', 0, TRUE),
('project-3', 'img3.png', 'Screenshot progetto', 0, TRUE);

COMMIT;