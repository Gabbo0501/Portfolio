import sqlite3 from 'sqlite3';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';
import fs from 'fs';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const dbPath = process.env.DB_PATH || join(__dirname, 'database/portfolio.db');
const schemaPath = join(__dirname, 'database/schema.sql');
const seedPath = join(__dirname, 'database/seed.sql');
const localSeedPath = join(__dirname, 'database/seed.local.sql');

const dbDir = dirname(dbPath);
if (!fs.existsSync(dbDir)) {
  fs.mkdirSync(dbDir, { recursive: true });
}

const reset = process.argv.includes('--reset');

const schema = fs.readFileSync(schemaPath, 'utf8');
const seed = fs.readFileSync(seedPath, 'utf8');
const localSeed = fs.existsSync(localSeedPath) ? fs.readFileSync(localSeedPath, 'utf8') : null;

const dropSql = `
  PRAGMA foreign_keys = OFF;
  DROP TABLE IF EXISTS project_images;
  DROP TABLE IF EXISTS project_tags;
  DROP TABLE IF EXISTS project_translations;
  DROP TABLE IF EXISTS projects;
  DROP TABLE IF EXISTS course_tags;
  DROP TABLE IF EXISTS courses;
  DROP TABLE IF EXISTS exams;
  DROP TABLE IF EXISTS certifications;
  DROP TABLE IF EXISTS skill_tag;
  DROP TABLE IF EXISTS tags;
  DROP TABLE IF EXISTS skill_categories;
  DROP TABLE IF EXISTS education;
  DROP TABLE IF EXISTS personal_info;
  PRAGMA foreign_keys = ON;
`;

const db = new sqlite3.Database(dbPath, (err) => {
  if (err) throw err;

  db.exec('PRAGMA foreign_keys = ON;');

  const ensurePersonalInfoColumns = (callback) => {
    db.all('PRAGMA table_info(personal_info)', (err, columns) => {
      if (err) return callback(err);

      const hasProfilePhotoPath = columns.some((column) => column.name === 'profile_photo_path');
      if (hasProfilePhotoPath) {
        callback();
        return;
      }

      db.exec('ALTER TABLE personal_info ADD COLUMN profile_photo_path TEXT', callback);
    });
  };

  db.serialize(() => {
    const initialSql = [reset ? dropSql : null, schema].filter(Boolean).join('\n');
    const seedSql = [seed, localSeed].filter(Boolean).join('\n');

    db.exec(initialSql, (err) => {
      if (err) {
        console.error('Seed failed:', err);
        process.exitCode = 1;
        db.close();
        return;
      }

      ensurePersonalInfoColumns((err) => {
        if (err) {
          console.error('Seed failed:', err);
          process.exitCode = 1;
          db.close();
          return;
        }

        db.exec(seedSql, (err) => {
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
  });
});
