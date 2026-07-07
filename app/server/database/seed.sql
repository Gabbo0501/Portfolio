BEGIN TRANSACTION;

-- ================================
-- Personal info
-- ================================
INSERT OR IGNORE INTO personal_info (language, name, bio, email, phone, location, linkedin, github, profile_photo_path) VALUES
('it',
  'Mario Rossi',
  'Profilo professionale di esempio utilizzato per popolare il portfolio.',
  'mario.rossi@example.com',
  '+391234567890',
  'Torino, Italia',
  'https://linkedin.com/in/mariorossi',
  'https://github.com/mariorossi',
  '/images/personal/img.png'
),
('en',
  'John Doe',
  'Sample professional profile used to populate the portfolio.',
  'john.doe@example.com',
  '+391234567890',
  'Turin, Italy',
  'https://linkedin.com/in/johndoe',
  'https://github.com/johndoe',
  '/images/personal/img.png'
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
-- Tags
-- ================================
INSERT OR IGNORE INTO tags (tag_id, language, label) VALUES
('html', 'it', 'Markup'),
('html', 'en', 'Markup'),
('css', 'it', 'Styling'),
('css', 'en', 'Styling'),
('javascript', 'it', 'Programmazione base'),
('javascript', 'en', 'Programming basics'),
('react', 'it', 'Interfacce UI'),
('react', 'en', 'UI interfaces'),
('nodejs', 'it', 'Runtime'),
('nodejs', 'en', 'Runtime'),
('express', 'it', 'Framework web'),
('express', 'en', 'Web framework'),
('python', 'it', 'Script'),
('python', 'en', 'Scripting'),
('java', 'it', 'OOP'),
('java', 'en', 'OOP'),
('mysql', 'it', 'DB relazionale'),
('mysql', 'en', 'Relational DB'),
('postgresql', 'it', 'DB SQL'),
('postgresql', 'en', 'SQL DB'),
('mongodb', 'it', 'DB documentale'),
('mongodb', 'en', 'Document DB'),
('git', 'it', 'Controllo versione'),
('git', 'en', 'Version control'),
('docker', 'it', 'Contenitori'),
('docker', 'en', 'Containers'),
('linux', 'it', 'Sistema operativo'),
('linux', 'en', 'Operating system'),
('figma', 'it', 'Prototipazione'),
('figma', 'en', 'Prototyping'),
('ux-design', 'it', 'Esperienza utente'),
('ux-design', 'en', 'User experience'),
('italian', 'it', 'Lingua italiana'),
('italian', 'en', 'Italian language'),
('english', 'it', 'Lingua inglese'),
('english', 'en', 'English language'),
('variables', 'it', 'Variabili'),
('variables', 'en', 'Variables'),
('control-flow', 'it', 'Flusso di controllo'),
('control-flow', 'en', 'Control flow'),
('sql', 'it', 'Query'),
('sql', 'en', 'Querying');

-- ================================
-- Skills
-- ================================
INSERT OR IGNORE INTO skill_categories (category_id, name_it, name_en, display_order) VALUES
('frontend', 'Frontend', 'Frontend', 1),
('backend', 'Backend', 'Backend', 2),
('persistency', 'Persistenza', 'Persistency', 3),
('tools', 'Strumenti', 'Tools', 4),
('design', 'Design', 'Design', 5),
('languages', 'Lingue', 'Languages', 6);

INSERT OR IGNORE INTO skill_tag (category_id, tag_id, display_order) VALUES
('frontend', 'html', 1),
('frontend', 'css', 2),
('frontend', 'javascript', 3),
('frontend', 'react', 4),
('backend', 'nodejs', 1),
('backend', 'express', 2),
('backend', 'python', 3),
('backend', 'java', 4),
('persistency', 'mysql', 1),
('persistency', 'postgresql', 2),
('persistency', 'mongodb', 3),
('tools', 'git', 1),
('tools', 'docker', 2),
('tools', 'linux', 3),
('design', 'figma', 1),
('design', 'ux-design', 2),
('languages', 'italian', 1),
('languages', 'english', 2);

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

INSERT OR IGNORE INTO project_tags (project_id, tag_id, display_order) VALUES
('project-1', 'react', 1),
('project-1', 'nodejs', 2),
('project-2', 'express', 1),
('project-2', 'postgresql', 2),
('project-3', 'docker', 1);

-- ================================
-- Courses
-- ================================
INSERT OR IGNORE INTO courses (course_code, language, name, description, semester, year, credits, grade, url, is_featured) VALUES
('C001', 'it', 'Programmazione', 'Corso introduttivo alla programmazione.', '1°', 2023, 6, '30', 'https://example.com', TRUE),
('C001', 'en', 'Programming', 'Introduction to programming.', '1st', 2023, 6, '30', 'https://example.com', TRUE),
('C002', 'it', 'Basi di Dati', 'Fondamenti di database relazionali.', '2°', 2023, 6, '28', 'https://example.com', TRUE),
('C002', 'en', 'Databases', 'Fundamentals of relational databases.', '2nd', 2023, 6, '28', 'https://example.com', TRUE);

INSERT OR IGNORE INTO course_tags (course_code, tag_id, display_order) VALUES
('C001', 'variables', 1),
('C001', 'control-flow', 2),
('C002', 'sql', 1);

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
