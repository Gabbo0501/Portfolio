import sqlite3 from 'sqlite3';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';
import fs from 'fs';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const dbPath = join(__dirname, 'database/portfolio.db');
const schemaPath = join(__dirname, 'database/schema.sql');
const seedPath = join(__dirname, 'database/seed.sql');
const localSeedPath = join(__dirname, 'database/seed.local.sql');

const reset = process.argv.includes('--reset');

const schema = fs.readFileSync(schemaPath, 'utf8');
const seed = fs.readFileSync(seedPath, 'utf8');
const localSeed = fs.existsSync(localSeedPath) ? fs.readFileSync(localSeedPath, 'utf8') : null;

const dropSql = `
  PRAGMA foreign_keys = OFF;
  DROP TABLE IF EXISTS project_images;
  DROP TABLE IF EXISTS project_technologies;
  DROP TABLE IF EXISTS project_translations;
  DROP TABLE IF EXISTS projects;
  DROP TABLE IF EXISTS course_topics;
  DROP TABLE IF EXISTS courses;
  DROP TABLE IF EXISTS exams;
  DROP TABLE IF EXISTS certifications;
  DROP TABLE IF EXISTS skills;
  DROP TABLE IF EXISTS skill_categories;
  DROP TABLE IF EXISTS education;
  DROP TABLE IF EXISTS personal_info;
  PRAGMA foreign_keys = ON;
`;

const db = new sqlite3.Database(dbPath, (err) => {
  if (err) throw err;

  db.exec('PRAGMA foreign_keys = ON;');

  db.serialize(() => {
    const steps = [];
    if (reset) steps.push(dropSql);
    steps.push(schema);
    steps.push(seed);
    if (localSeed) steps.push(localSeed);

    const sql = steps.join('\n');
    db.exec(sql, (err) => {
      if (err) {
        console.error('Seed failed:', err);
        process.exitCode = 1;
      } else {
        console.log(
          `${reset ? 'Database reset + seeded successfully' : 'Database seeded successfully'}${
            localSeed ? ' (including seed.local.sql)' : ''
          }.`
        );
      }

      db.close();
    });
  });
});
