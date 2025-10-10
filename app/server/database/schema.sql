-- Create personal_info table
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
    UNIQUE(language)
);

-- Create education table
CREATE TABLE IF NOT EXISTS education (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    language TEXT NOT NULL,
    degree TEXT NOT NULL,
    institution TEXT NOT NULL,
    description TEXT,
    start_year INTEGER,
    end_year INTEGER,
    gpa REAL
);

-- Create courses table
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

-- Create course_topics table
CREATE TABLE IF NOT EXISTS course_topics (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    course_code TEXT NOT NULL,
    language TEXT NOT NULL,
    topic TEXT NOT NULL,
    FOREIGN KEY (course_code) REFERENCES courses(course_code)
);

-- Create exams table
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

-- Create projects table
CREATE TABLE IF NOT EXISTS projects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_id TEXT NOT NULL,
    language TEXT NOT NULL,
    name TEXT NOT NULL,
    description TEXT,
    status TEXT,
    github_url TEXT,
    demo_url TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(project_id, language)
);

-- Create project_technologies table
CREATE TABLE IF NOT EXISTS project_technologies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_id TEXT NOT NULL,
    technology TEXT NOT NULL,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- Create skill_categories table
CREATE TABLE IF NOT EXISTS skill_categories (
    category_id TEXT PRIMARY KEY,
    name_it TEXT NOT NULL,
    name_en TEXT NOT NULL
);

-- Create skills table
CREATE TABLE IF NOT EXISTS skills (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    category_id TEXT NOT NULL,
    technology TEXT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES skill_categories(category_id)
);

-- Certifications table (multilingual)
CREATE TABLE certifications (
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


-- Insert sample data for Italian
INSERT OR IGNORE INTO personal_info (language, name, bio, email, phone, location, linkedin, github) VALUES ('it', 
    'Gabriele Mondino', 
    'Sono Gabriele Mondino, nato il 5 gennaio 2002 a Cuneo. Attualmente sono uno studente magistrale in Ingegneria Informatica (Computer Engineering) al Politecnico di Torino, dopo aver conseguito la laurea triennale. Mi appassiona lo sviluppo software, con particolare interesse per le applicazioni web e mobile.', 
    'gabrielemondino05@gmail.com', 
    '+393200325640', 
    'Borgo San Dalmazzo (CN), Italia',
    'https://www.linkedin.com/in/gabriele-mondino-ba6944359?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app',
    'https://github.com/Gabbo0501'
);

INSERT OR IGNORE INTO personal_info (language, name, bio, email, phone, location, linkedin, github) VALUES ('en', 
    'Gabriele Mondino', 
    'I am Gabriele Mondino, born on January 5, 2002 in Cuneo. I am currently a Master student in Computer Engineering at Politecnico di Torino, after completing my Bachelor degree. I am passionate about software development, with particular interest in web and mobile applications.', 
    'gabrielemondino05@gmail.com', 
    '+393200325640', 
    'Borgo San Dalmazzo (CN), Italy',
    'https://www.linkedin.com/in/gabriele-mondino-ba6944359?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app',
    'https://github.com/Gabbo0501'
);

INSERT OR IGNORE INTO education (language, degree, institution, description, start_year, end_year, gpa) VALUES ('it', 
    'Laurea Magistrale in Ingegneria Informatica (Computer Engineering)', 
    'Politecnico di Torino', 
    'Percorso specialistico in Computer Engineering, ramo Software. Competenze avanzate in ingegneria del software, applicazioni web e mobile, interazione uomo-macchina.', 
    2025, 
    NULL, 
    NULL
);

INSERT OR IGNORE INTO education (language, degree, institution, description, start_year, end_year, gpa) VALUES ('it', 
    'Laurea in Ingegneria Informatica', 
    'Politecnico di Torino', 
    'Solida base in informatica e ingegneria del software. Competenze in programmazione, algoritmi e strutture dati, basi di dati, reti di calcolatori, sistemi operativi.', 
    2021, 
    2025, 
    94
);

INSERT OR IGNORE INTO education (language, degree, institution, description, start_year, end_year, gpa) VALUES ('it', 
    'Diploma di Maturità Scientifica', 
    'Liceo Scientifico G. Peano, Cuneo', 
    'Diploma di scuola superiore con indirizzo scientifico.', 
    2016, 
    2021, 
    88
);

INSERT OR IGNORE INTO education (language, degree, institution, description, start_year, end_year, gpa) VALUES ('en', 
    'Master''s Degree in Computer Engineering', 
    'Politecnico di Torino', 
    'Specialized program in Computer Engineering, Software track. Advanced skills in software engineering, web and mobile applications, human-computer interaction.', 
    2025, 
    NULL, 
    NULL
);

INSERT OR IGNORE INTO education (language, degree, institution, description, start_year, end_year, gpa) VALUES ('en', 
    'Bachelor''s Degree in Computer Engineering', 
    'Politecnico di Torino', 
    'Solid foundation in computer science and software engineering. Skills in programming, algorithms and data structures, databases, computer networks, operating systems.', 
    2021, 
    2025, 
    94
);

INSERT OR IGNORE INTO education (language, degree, institution, description, start_year, end_year, gpa) VALUES ('en', 
    'Scientific High School Diploma', 
    'Liceo Scientifico G. Peano, Cuneo', 
    'High school diploma with scientific curriculum.',
    2016, 
    2021, 
    88
);

-- Insert sample skill categories
INSERT OR IGNORE INTO skill_categories (category_id, name_it, name_en) VALUES 
('frontend', 'Frontend', 'Frontend'),
('backend', 'Backend', 'Backend'),
('tools', 'Strumenti e Tecnologie', 'Tools & Technologies'),
('languages', 'Lingue', 'Languages');

-- Insert sample skills
INSERT OR IGNORE INTO skills (category_id, technology) VALUES 
('frontend', 'React'),
('frontend', 'JavaScript'),
('frontend', 'HTML5'),
('frontend', 'CSS3'),
('frontend', 'Bootstrap'),
('backend', 'C++'),
('backend', 'Node.js'),
('backend', 'Express'),
('backend', 'Python'),
('backend', 'Java'),
('backend', 'Rust'),
('backend', 'Flask'),
('tools', 'SQLite'),
('tools', 'MySQL'),
('tools', 'MongoDB'),
('tools', 'Git'),
('tools', 'Docker'),
('languages', 'Italiano (Madrelingua)'),
('languages', 'Inglese (C1 - IELTS)');

-- Insert sample projects
INSERT OR IGNORE INTO projects (project_id, language, name, description, status, github_url, demo_url) VALUES 
('portfolio', 'it', 'Portfolio Personale Multilingua', 'Sito web portfolio sviluppato con React e Node.js, featuring sistema multilingua completo e database SQLite per gestione dinamica dei contenuti.', 'Completato', 'https://github.com/Gabbo0501/Portfolio', NULL);

INSERT OR IGNORE INTO projects (project_id, language, name, description, status, github_url, demo_url) VALUES 
('portfolio', 'en', 'Multilingual Personal Portfolio', 'Portfolio website built with React and Node.js, featuring complete multilingual system and SQLite database for dynamic content management.', 'Completed', 'https://github.com/Gabbo0501/Portfolio', NULL);

INSERT OR IGNORE INTO projects (project_id, language, name, description, status, github_url, demo_url) VALUES 
('indovina-frase', 'it', 'Indovina la Frase', 'Applicazione web full-stack sviluppata come progetto d''esame per il corso di Applicazioni Web I. Gioco interattivo dove l''utente deve indovinare frasi selezionando le lettere corrette. Include sistema di autenticazione, gestione utenti, database SQLite e interfaccia React moderna con Vite.', 'Completato', 'https://github.com/Gabbo0501/Guess-the-Phrase', NULL);

INSERT OR IGNORE INTO projects (project_id, language, name, description, status, github_url, demo_url) VALUES 
('indovina-frase', 'en', 'Guess the Phrase', 'Full-stack web application developed as exam project for Web Applications I course. Interactive game where users must guess phrases by selecting correct letters. Features authentication system, user management, SQLite database and modern React interface with Vite.', 'Completed', 'https://github.com/Gabbo0501/Guess-the-Phrase', NULL);

INSERT OR IGNORE INTO projects (project_id, language, name, description, status, github_url, demo_url) VALUES 
('ruggine-chat', 'it', 'Ruggine - Chat Real-time', 'Applicazione di chat real-time sviluppata in team per l''esame di Programmazione di Sistema. Server scritto in Rust con Axum e WebSocket per comunicazione istantanea, client React moderno. Include autenticazione, gestione gruppi, inviti utenti e sistema di logging delle performance CPU.', 'In corso', NULL, NULL);

INSERT OR IGNORE INTO projects (project_id, language, name, description, status, github_url, demo_url) VALUES 
('ruggine-chat', 'en', 'Ruggine - Real-time Chat', 'Real-time chat application developed as team project for System Programming exam. Server written in Rust with Axum and WebSocket for instant communication, modern React client. Features authentication, group management, user invitations and CPU performance logging system.', 'In progress', NULL, NULL);

-- Insert sample project technologies
INSERT OR IGNORE INTO project_technologies (project_id, technology) VALUES 
('portfolio', 'React'),
('portfolio', 'Node.js'),
('portfolio', 'SQLite'),
('portfolio', 'Express'),
('portfolio', 'Bootstrap'),
('portfolio', 'JavaScript'),
('indovina-frase', 'React'),
('indovina-frase', 'Vite'),
('indovina-frase', 'Node.js'),
('indovina-frase', 'Express'),
('indovina-frase', 'SQLite'),
('indovina-frase', 'JavaScript'),
('indovina-frase', 'CSS3'),
('indovina-frase', 'Bootstrap'),
('indovina-frase', 'Authentication'),
('ruggine-chat', 'Rust'),
('ruggine-chat', 'Axum'),
('ruggine-chat', 'WebSocket'),
('ruggine-chat', 'React'),
('ruggine-chat', 'Vite'),
('ruggine-chat', 'SQLite'),
('ruggine-chat', 'Real-time'),
('ruggine-chat', 'Team Development');

-- Insert sample courses
INSERT OR IGNORE INTO courses (course_code, language, name, description, semester, year, credits, grade, url, is_featured) VALUES 
('01UDFYG', 'it', 'Applicazioni Web I', 'Corso magistrale che presenta le principali tecniche per la realizzazione di applicazioni web, con focus sulla realizzazione di architetture frontend–backend con CORS.', '2°', 2025, 6, '30', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01UDFYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N", TRUE);

INSERT OR IGNORE INTO courses (course_code, language, name, description, semester, year, credits, grade, url, is_featured) VALUES 
('01UDFYG', 'en', 'Web Applications I', 'Master’s course presenting the main techniques for developing web applications, with a focus on frontend–backend architectures using CORS.', '2nd', 2025, 6, '30', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01TXYYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N", TRUE);

INSERT OR IGNORE INTO courses (course_code, language, name, description, semester, year, credits, grade, url, is_featured) VALUES 
('01SQMYG', 'it', 'Data Science e Tecnologie per le Basi di Dati', 'Corso che affronta gli aspetti fondamentali della tecnologia dei DBMS e le modalità di gestione delle basi di dati per l''analisi.', '1°', 2025, 8, '30L', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01SQMYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N", TRUE);

INSERT OR IGNORE INTO courses (course_code, language, name, description, semester, year, credits, grade, url, is_featured) VALUES 
('01SQMYG', 'en', 'Data Science and Database Technologies', 'Course addressing fundamental aspects of DBMS technology and database management for data analysis.', '1st', 2025, 8, '30L', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01SQJYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N", TRUE);

-- Insert sample course topics
INSERT OR IGNORE INTO course_topics (course_code, language, topic) VALUES 
('01UDFYG', 'it', 'JavaScript Avanzato'),
('01UDFYG', 'it', 'React'),
('01UDFYG', 'it', 'Express'),
('01UDFYG', 'it', 'HTTP APIs'),
('01UDFYG', 'it', 'SQLite'),
('01UDFYG', 'it', 'Async Programming'),
('01UDFYG', 'it', 'Autenticazione & Autorizzazione');

INSERT OR IGNORE INTO course_topics (course_code, language, topic) VALUES 
('01UDFYG', 'en', 'Advanced JavaScript'),
('01UDFYG', 'en', 'React'),
('01UDFYG', 'en', 'Express'),
('01UDFYG', 'en', 'HTTP APIs'),
('01UDFYG', 'en', 'SQLite'),
('01UDFYG', 'en', 'Async Programming'),
('01UDFYG', 'en', 'Authentication & Authorization');

INSERT OR IGNORE INTO course_topics (course_code, language, topic) VALUES 
('01SQMYG', 'it', 'Sistemi DBMS Avanzati'),
('01SQMYG', 'it', 'Data Warehouse'),
('01SQMYG', 'it', 'NoSQL'),
('01SQMYG', 'it', 'Basi di Dati Distribuite'),
('01SQMYG', 'it', 'Classificazione & Clustering');

INSERT OR IGNORE INTO course_topics (course_code, language, topic) VALUES 
('01SQMYG', 'en', 'Advanced DBMS Systems'),
('01SQMYG', 'en', 'Data Warehouse'),
('01SQMYG', 'en', 'NoSQL'),
('01SQMYG', 'en', 'Distributed Databases'),
('01SQMYG', 'en', 'Classification & Clustering');

-- Insert sample exams  
-- MAGISTRALE
INSERT OR IGNORE INTO exams (exam_code, language, name, degree_type, credits, grade, exam_date, url) VALUES 
('02GOLYG', 'it', 'Architetture dei sistemi di elaborazione', 'magistrale', 10, '29', '2025-02-13', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=02GOLYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N"),
('01PDWYG', 'it', 'Information systems', 'magistrale', 6, '25', '2025-02-20', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01PDWYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N"),
('01VRYYG', 'it', 'Software engineering', 'magistrale', 8, '27', '2025-06-23', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01VRYYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N"),
('01SQMYG', 'it', 'Data Science e Tecnologie per le Basi di Dati', 'magistrale', 8, '30L', '2025-06-25', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01SQMYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N"),
('02JEUYG', 'it', 'Formal languages and compilers', 'magistrale', 6, '29', '2025-09-10', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=02JEUYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N"),
('01UDFYG', 'it', 'Applicazioni Web I', 'magistrale', 6, '30', '2025-09-17', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01UDFYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N");

INSERT OR IGNORE INTO exams (exam_code, language, name, degree_type, credits, grade, exam_date, url) VALUES 
('02GOLYG', 'en', 'Computer System Architectures', 'magistrale', 10, '29', '2025-02-13', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=02LSEYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N"),
('01PDWYG', 'en', 'Information Systems', 'magistrale', 6, '25', '2025-02-20', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01PDWYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N"),
('01VRYYG', 'en', 'Software Engineering', 'magistrale', 8, '27', '2025-06-23', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01VRYYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N"),
('01SQMYG', 'en', 'Data Science and Database Technologies', 'magistrale', 8, '30L', '2025-06-25', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01SQJYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N"),
('02JEUYG', 'en', 'Formal Languages and Compilers', 'magistrale', 6, '29', '2025-09-10', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=02JEUYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N"),
('01UDFYG', 'en', 'Web Applications I', 'magistrale', 6, '30', '2025-09-17', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01TXYYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N");

-- TRIENNALE
INSERT OR IGNORE INTO exams (exam_code, language, name, degree_type, credits, grade, exam_date, url) VALUES 
('14BHDOA', 'it', 'Informatica', 'triennale', 8, '30L', '2022-02-01', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=14BHDYE&p_a_acc=2026&p_header=S&p_lang=IT&multi=N"),
('16ACFOA', 'it', 'Analisi matematica I', 'triennale', 10, '22', '2022-02-10', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=16ACFYE&p_a_acc=2026&p_header=S&p_lang=IT&multi=N"),
('01FYZOA', 'it', 'Tecniche di programmazione', 'triennale', 6, '28', '2022-07-04', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01FYZYE&p_a_acc=2026&p_header=S&p_lang=IT&multi=N"),
('17AXOOA', 'it', 'Fisica I', 'triennale', 10, '23', '2022-07-07', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=17AXOYE&p_a_acc=2026&p_header=S&p_lang=IT&multi=N"),
('01RKCOA', 'it', 'Algebra lineare e geometria', 'triennale', 10, '26', '2022-09-15', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01RKCYE&p_a_acc=2026&p_header=S&p_lang=IT&multi=N"),
('26ACIOA', 'it', 'Analisi matematica II', 'triennale', 10, '21', '2023-02-02', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=26ACIYE&p_a_acc=2027&p_header=S&p_lang=IT&multi=N"),
('01URKOA', 'it', 'Elettromagnetismo e Teoria dei circuiti', 'triennale', 12, '25', '2023-02-24', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01URKYE&p_a_acc=2027&p_header=S&p_lang=IT&multi=N"),
('01DEIOA', 'it', 'Politica e tecnica (Grandi Sfide - Digitale)', 'triennale', 6, '26', '2023-06-19', "https://didattica.polito.it/pls/portal30/sviluppo.guide.visualizza?p_cod_ins=01DEIYE&p_a_acc=2028&p_lang=IT"),
('12AGAOA', 'it', 'Calcolatori elettronici', 'triennale', 8, '19', '2023-06-23', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=12AGAYE&p_a_acc=2027&p_header=S&p_lang=IT&multi=N"),
('14AFQOA', 'it', 'Basi di dati', 'triennale', 8, '28', '2023-06-26', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=14AFQYE&p_a_acc=2027&p_header=S&p_lang=IT&multi=N"),
('09BQXOA', 'it', 'Metodi matematici per l''ingegneria', 'triennale', 10, '23', '2023-07-13', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=09BQXYE&p_a_acc=2027&p_header=S&p_lang=IT&multi=N"),
('15CDUOA', 'it', 'Reti di calcolatori', 'triennale', 8, '29', '2024-02-02', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=15CDUYE&p_a_acc=2028&p_header=S&p_lang=IT&multi=N"),
('05CJCOA', 'it', 'Sistemi operativi', 'triennale', 6, '26', '2024-02-07', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=05CJCYE&p_a_acc=2028&p_header=S&p_lang=IT&multi=N"),
('IAW001', 'it', 'Introduzione alle Applicazioni Web', 'triennale', 6, '28', '2024-02-09', "https://didattica.polito.it/pls/portal30/sviluppo.guide.visualizza?p_cod_ins=01VRPYE&p_a_acc=2028"),
('TES001', 'it', 'Teoria ed elaborazione dei segnali', 'triennale', 8, '23', '2024-02-15', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=02MOOYE&p_a_acc=2028&p_header=S&p_lang=IT&multi=N"),
('05QXVOA', 'it', 'Sistemi elettronici, tecnologie e misure', 'triennale', 8, '20', '2024-03-01', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=05QXVOA&p_a_acc=2025&p_header=S&p_lang=IT&multi=N"),
('03MZGOA', 'it', 'Elettronica applicata', 'triennale', 8, '27', '2024-06-25', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=08ATIOA&p_a_acc=2025&p_header=S&p_lang=IT&multi=N"),
('04JEYOA', 'it', 'Programmazione a oggetti', 'triennale', 8, '24', '2024-07-03', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=09CBIYE&p_a_acc=2028&p_header=S&p_lang=IT&multi=N"),
('03AAXOA', 'it', 'Algoritmi e strutture dati', 'triennale', 8, '21', '2024-07-04', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=03AAXYE&p_a_acc=2027&p_header=S&p_lang=IT&multi=N"),
('18AKSOA', 'it', 'Controlli automatici', 'triennale', 10, '26', '2024-07-09', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=18AKSYE&p_a_acc=2028&p_header=S&p_lang=IT&multi=N"),
('15AHMOA', 'it', 'Chimica', 'triennale', 8, '29', '2025-01-31', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=15AHMYE&p_a_acc=2026&p_header=S&p_lang=IT&multi=N");

INSERT OR IGNORE INTO exams (exam_code, language, name, degree_type, credits, grade, exam_date, url) VALUES 
('14BHDOA', 'en', 'Computer Science', 'triennale', 8, '30L', '2022-02-01', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=07JCJYF&p_a_acc=2026&p_header=S&p_lang=IT&multi=N"),
('16ACFOA', 'en', 'Mathematical Analysis I', 'triennale', 10, '22', '2022-02-10', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=04KWQYF&p_a_acc=2026&p_header=S&p_lang=IT&multi=N"),
('01FYZOA', 'en', 'Programming Techniques', 'triennale', 6, '28', '2022-07-04', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=02OJPYF&p_a_acc=2026&p_header=S&p_lang=IT&multi=N"),
('17AXOOA', 'en', 'Physics I', 'triennale', 10, '23', '2022-07-07', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=04KXVYF&p_a_acc=2026&p_header=S&p_lang=IT&multi=N"),
('01RKCOA', 'en', 'Linear Algebra and Geometry', 'triennale', 10, '26', '2022-09-15', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=03KXTYF&p_a_acc=2026&p_header=S&p_lang=IT&multi=N"),
('26ACIOA', 'en', 'Mathematical Analysis II', 'triennale', 10, '21', '2023-02-02', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=07KXUYF&p_a_acc=2027&p_header=S&p_lang=IT&multi=N"),
('01URKOA', 'en', 'Electromagnetism and Circuit Theory', 'triennale', 12, '25', '2023-02-24', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01URLYF&p_a_acc=2027&p_header=S&p_lang=IT&multi=N"),
('01DEIOA', 'en', 'Politics and Technology (Digital Challenges)', 'triennale', 6, '26', '2023-06-19', "https://didattica.polito.it/pls/portal30/sviluppo.guide.visualizza?p_cod_ins=01DEIYE&p_a_acc=2028&p_lang=IT"),
('12AGAOA', 'en', 'Computer Architecture', 'triennale', 8, '19', '2023-06-23', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=02KTMYF&p_a_acc=2027&p_header=S&p_lang=IT&multi=N"),
('14AFQOA', 'en', 'Introduction to Databases', 'triennale', 8, '28', '2023-06-26', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01RKWYF&p_a_acc=2027&p_header=S&p_lang=IT&multi=N"),
('09BQXOA', 'en', 'Mathematical Methods for Engineering', 'triennale', 10, '23', '2023-07-13', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01UROYF&p_a_acc=2027&p_header=S&p_lang=IT&multi=N"),
('15CDUOA', 'en', 'Computer Networks', 'triennale', 8, '29', '2024-02-02', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=08KSIYE&p_a_acc=2028&p_header=S&p_lang=IT&multi=N"),
('05CJCOA', 'en', 'Operating Systems', 'triennale', 6, '26', '2024-02-07', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=04JEZYE&p_a_acc=2028&p_header=S&p_lang=IT&multi=N"),
('IAW001', 'en', 'Introduction to Web Applications', 'triennale', 6, '28', '2024-02-09', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01VRPYE&p_a_acc=2028&p_header=S&p_lang=IT&multi=N"),
('TES001', 'en', 'Signal Theory and Processing', 'triennale', 8, '23', '2024-02-15', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=02OGGYE&p_a_acc=2028&p_header=S&p_lang=IT&multi=N"),
('05QXVOA', 'en', 'Electronic Systems, Technologies and Measurements', 'triennale', 8, '20', '2024-03-01', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=06QXWOA&p_a_acc=2025&p_header=S&p_lang=IT&multi=N"),
('03MZGOA', 'en', 'Applied Electronics', 'triennale', 8, '27', '2024-06-25', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=03MZGOA&p_a_acc=2025&p_header=S&p_lang=IT&multi=N"),
('04JEYOA', 'en', 'Object-Oriented Programming', 'triennale', 8, '24', '2024-07-03', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=04JEYYE&p_a_acc=2028&p_header=S&p_lang=IT&multi=N"),
('03AAXOA', 'en', 'Algorithms and Data Structures', 'triennale', 8, '21', '2024-07-04', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01URNYF&p_a_acc=2027&p_header=S&p_lang=IT&multi=N"),
('18AKSOA', 'en', 'Automatic Control', 'triennale', 10, '26', '2024-07-09', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=06LSLYE&p_a_acc=2028&p_header=S&p_lang=IT&multi=N"),
('15AHMOA', 'en', 'Chemistry', 'triennale', 8, '29', '2025-01-31', "https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=06KWRYF&p_a_acc=2026&p_header=S&p_lang=IT&multi=N");

-- Certifications data
INSERT INTO certifications (certification_id, language, name, organization, description, level, date_obtained, is_featured) VALUES 
('ielts-c1', 'it', 'IELTS Academic', 'British Council', 'Certificazione internazionale che attesta un livello avanzato di competenza nella lingua inglese (Common European Framework C1).', 'C1', '2024-05-15', TRUE),
('ielts-c1', 'en', 'IELTS Academic', 'British Council', 'International certification that attests an advanced level of English language proficiency (Common European Framework C1)', 'C1', '2024-05-15', TRUE);