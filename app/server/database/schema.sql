-- Schema only (DDL).
-- Seed data lives in: database/seed.sql

-- ================================
-- personal_info
-- ================================
CREATE TABLE IF NOT EXISTS personal_info (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    language TEXT NOT NULL,
    name TEXT NOT NULL,
    bio TEXT,
    email TEXT,
    phone TEXT,
    location TEXT,
    linkedin TEXT,
    github TEXT,
    profile_photo_path TEXT,
    UNIQUE(language)
);
CREATE INDEX IF NOT EXISTS idx_personal_info_language ON personal_info(language);

-- ================================
-- education
-- ================================
CREATE TABLE IF NOT EXISTS education (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    language TEXT NOT NULL,
    degree TEXT NOT NULL,
    institution TEXT NOT NULL,
    description TEXT,
    start_year INTEGER,
    end_year INTEGER,
    gpa REAL,
    UNIQUE(language, degree, institution, start_year)
);
CREATE INDEX IF NOT EXISTS idx_education_language ON education(language);

-- ================================
-- courses
-- ================================
CREATE TABLE IF NOT EXISTS courses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    course_code TEXT NOT NULL,
    language TEXT NOT NULL,
    name TEXT NOT NULL,
    description TEXT,
    semester TEXT,
    year INTEGER,
    credits INTEGER,
    grade TEXT,
    url TEXT,
    is_featured BOOLEAN DEFAULT FALSE,
    UNIQUE(course_code, language)
);
CREATE INDEX IF NOT EXISTS idx_courses_language ON courses(language);
CREATE INDEX IF NOT EXISTS idx_courses_featured ON courses(language, is_featured);

-- ================================
-- exams
-- ================================
CREATE TABLE IF NOT EXISTS exams (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    exam_code TEXT NOT NULL,
    language TEXT NOT NULL,
    name TEXT NOT NULL,
    degree_type TEXT NOT NULL, -- 'magistrale' or 'triennale'
    credits INTEGER,
    grade TEXT,
    exam_date DATE,
    url TEXT,
    UNIQUE(exam_code, language)
);
CREATE INDEX IF NOT EXISTS idx_exams_language_degree_date ON exams(language, degree_type, exam_date);

-- ================================
-- projects (base) + translations
-- ================================
CREATE TABLE IF NOT EXISTS projects (
    project_id TEXT PRIMARY KEY,
    github_url TEXT,
    demo_url TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS project_translations (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_id TEXT NOT NULL,
    language TEXT NOT NULL,
    name TEXT NOT NULL,
    description TEXT,
    status TEXT,
    UNIQUE(project_id, language),
    FOREIGN KEY (project_id) REFERENCES projects(project_id) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS idx_project_translations_language ON project_translations(language);

CREATE TABLE IF NOT EXISTS project_images (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_id TEXT NOT NULL,
    image_path TEXT NOT NULL,
    alt_text TEXT,
    display_order INTEGER DEFAULT 0,
    is_primary BOOLEAN DEFAULT FALSE,
    UNIQUE(project_id, image_path),
    FOREIGN KEY (project_id) REFERENCES projects(project_id) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS idx_project_images_project_order ON project_images(project_id, display_order);

-- ================================
-- shared tags
-- ================================
CREATE TABLE IF NOT EXISTS skill_categories (
    category_id TEXT PRIMARY KEY,
    name_it TEXT NOT NULL,
    name_en TEXT NOT NULL,
    display_order INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS tags (
    tag_id TEXT NOT NULL,
    language TEXT NOT NULL,
    label TEXT NOT NULL,
    PRIMARY KEY (tag_id, language)
);
CREATE INDEX IF NOT EXISTS idx_tags_language ON tags(language);

CREATE TABLE IF NOT EXISTS skill_tag (
    category_id TEXT NOT NULL,
    tag_id TEXT NOT NULL,
    display_order INTEGER DEFAULT 0,
    PRIMARY KEY (category_id, tag_id),
    FOREIGN KEY (category_id) REFERENCES skill_categories(category_id) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS idx_skill_tag_category_order ON skill_tag(category_id, display_order);

CREATE TABLE IF NOT EXISTS project_tags (
    project_id TEXT NOT NULL,
    tag_id TEXT NOT NULL,
    display_order INTEGER DEFAULT 0,
    PRIMARY KEY (project_id, tag_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS idx_project_tags_project_order ON project_tags(project_id, display_order);

CREATE TABLE IF NOT EXISTS course_tags (
    course_code TEXT NOT NULL,
    tag_id TEXT NOT NULL,
    display_order INTEGER DEFAULT 0,
    PRIMARY KEY (course_code, tag_id)
);

-- ================================
-- certifications
-- ================================
CREATE TABLE IF NOT EXISTS certifications (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    certification_id VARCHAR(50) NOT NULL,
    language VARCHAR(2) NOT NULL,
    name VARCHAR(200) NOT NULL,
    organization VARCHAR(200) NOT NULL,
    description TEXT,
    level VARCHAR(50),
    date_obtained DATE,
    expiry_date DATE,
    credential_id VARCHAR(100),
    url TEXT,
    is_featured BOOLEAN DEFAULT TRUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(certification_id, language)
);
CREATE INDEX IF NOT EXISTS idx_certifications_language_featured ON certifications(language, is_featured);
