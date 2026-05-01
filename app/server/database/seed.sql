BEGIN TRANSACTION;

-- ================================
-- Personal info
-- ================================
INSERT OR IGNORE INTO personal_info (language, name, bio, email, phone, location, linkedin, github) VALUES
('it',
  'Gabriele Mondino',
  'Sono Gabriele Mondino, nato il 5 gennaio 2002 a Cuneo. Attualmente sono uno studente magistrale in Ingegneria Informatica (Computer Engineering) al Politecnico di Torino, dopo aver conseguito la laurea triennale. Mi appassiona lo sviluppo software, con particolare interesse per le applicazioni web e mobile.',
  'gabrielemondino05@gmail.com',
  '+393200325640',
  'Borgo San Dalmazzo (CN), Italia',
  'https://www.linkedin.com/in/gabriele-mondino-ba6944359?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app',
  'https://github.com/Gabbo0501'
),
('en',
  'Gabriele Mondino',
  'I am Gabriele Mondino, born on January 5, 2002 in Cuneo. I am currently a Master student in Computer Engineering at Politecnico di Torino, after completing my Bachelor degree. I am passionate about software development, with particular interest in web and mobile applications.',
  'gabrielemondino05@gmail.com',
  '+393200325640',
  'Borgo San Dalmazzo (CN), Italy',
  'https://www.linkedin.com/in/gabriele-mondino-ba6944359?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app',
  'https://github.com/Gabbo0501'
);

-- ================================
-- Education
-- ================================
INSERT OR IGNORE INTO education (language, degree, institution, description, start_year, end_year, gpa) VALUES
('it',
  'Laurea Magistrale in Ingegneria Informatica (Computer Engineering)',
  'Politecnico di Torino',
  'Percorso specialistico in Computer Engineering, ramo Software. Competenze avanzate in ingegneria del software, applicazioni web e mobile, interazione uomo-macchina.',
  2025,
  NULL,
  NULL
),
('it',
  'Laurea in Ingegneria Informatica',
  'Politecnico di Torino',
  'Solida base in informatica e ingegneria del software. Competenze in programmazione, algoritmi e strutture dati, basi di dati, reti di calcolatori, sistemi operativi.',
  2021,
  2025,
  94
),
('it',
  'Diploma di Maturità Scientifica',
  'Liceo Scientifico G. Peano, Cuneo',
  'Diploma di scuola superiore con indirizzo scientifico.',
  2016,
  2021,
  88
),
('en',
  'Master''s Degree in Computer Engineering',
  'Politecnico di Torino',
  'Specialized program in Computer Engineering, Software track. Advanced skills in software engineering, web and mobile applications, human-computer interaction.',
  2025,
  NULL,
  NULL
),
('en',
  'Bachelor''s Degree in Computer Engineering',
  'Politecnico di Torino',
  'Solid foundation in computer science and software engineering. Skills in programming, algorithms and data structures, databases, computer networks, operating systems.',
  2021,
  2025,
  94
),
('en',
  'Scientific High School Diploma',
  'Liceo Scientifico G. Peano, Cuneo',
  'High school diploma with scientific curriculum.',
  2016,
  2021,
  88
);

-- ================================
-- Skill categories + skills
-- ================================
INSERT OR IGNORE INTO skill_categories (category_id, name_it, name_en) VALUES
('frontend', 'Frontend', 'Frontend'),
('backend', 'Backend', 'Backend'),
('persistency', 'Persistency', 'Persistency'),
('tools', 'Strumenti e Infrastruttura', 'Tools & Infrastructure'),
('design', 'Design e UX Research', 'Design & UX Research'),
('languages', 'Lingue', 'Languages');

INSERT OR IGNORE INTO skills (category_id, technology) VALUES
('frontend', 'React'),
('frontend', 'HTML5'),
('frontend', 'CSS3'),
('frontend', 'Bootstrap'),
('backend', 'JavaScript'),
('backend', 'TypeScript'),
('backend', 'Express'),
('backend', 'Python'),
('backend', 'Flask'),
('backend', 'Rust'),
('backend', 'Kotlin'),
('backend', 'Spring Boot'),
('persistency', 'SQLite'),
('persistency', 'MySQL'),
('persistency', 'MongoDB'),
('persistency', 'PostgreSQL'),
('persistency', 'TypeORM'),
('persistency', 'Prisma'),
('persistency', 'MinIO'),
('tools', 'Git'),
('tools', 'Docker'),
('tools', 'Gradle'),
('tools', 'Telegram Bot API'),
('tools', 'TUS Protocol'),
('tools', 'Kafka'),
('tools', 'OAuth2/OIDC'),
('tools', 'Keycloak'),
('design', 'Figma'),
('design', 'User Research'),
('design', 'Usability Testing'),
('design', 'UX Design'),
('design', 'Prototyping'),
('design', 'HCI Methodology'),
('languages', 'Italiano (Madrelingua)'),
('languages', 'Inglese (C1 - IELTS)');

-- ================================
-- Projects (base) + translations
-- ================================
INSERT OR IGNORE INTO projects (project_id, github_url, demo_url, created_at) VALUES
('participium', 'https://github.com/Gabbo0501/participium', NULL, '2025-09-01T00:00:00Z'),
('document-portal-ms', NULL, NULL, '2026-01-01T00:00:00Z'),
('so-menga', 'https://github.com/Gabbo0501/somenga', NULL, '2025-06-01T00:00:00Z'),
('portfolio', 'https://github.com/Gabbo0501/Portfolio', NULL, '2025-03-01T00:00:00Z'),
('indovina-frase', 'https://github.com/Gabbo0501/Guess-the-Phrase', NULL, '2024-12-01T00:00:00Z');

INSERT OR IGNORE INTO project_translations (project_id, language, name, description, status) VALUES
('participium', 'it', 'Participium - Citizen Reporting Platform', 'Applicazione web full-stack per la gestione di segnalazioni urbane sviluppata per il Comune di Torino. Consente ai cittadini di inviare report geolocalizzati con foto, seguire lo stato delle segnalazioni e ricevere notifiche (email e Telegram). Include gestione ruoli, workflow di approvazione e integrazione con bot Telegram.', 'Completato'),
('participium', 'en', 'Participium - Citizen Reporting Platform', 'Full-stack web application for urban issue reporting developed for the Municipality of Turin. Citizens can submit geolocated reports with photos, track status updates, and receive email and Telegram notifications. Features role-based access control, approval workflow, and Telegram bot integration.', 'Completed'),
('document-portal-ms', 'it', 'Company Document Portal', 'Sistema distribuito per la gestione documentale aziendale basato su microservizi. Permette upload resumable (TUS), versioning immutabile, gestione metadata, ricerca avanzata, condivisione con controllo accessi basato su ruoli (OAuth2/OIDC), processing asincrono tramite Kafka e pipeline AI monitorabili con osservabilità e tracing distribuito.', 'In corso'),
('document-portal-ms', 'en', 'Company Document Portal', 'Distributed microservices-based document management system for secure corporate collaboration. Supports resumable uploads (TUS), immutable versioning, metadata management, role-based access control (OAuth2/OIDC), asynchronous processing via Kafka, AI-powered document analysis, and full observability with monitoring and distributed tracing.', 'In progress'),
('so-menga', 'it', 'So Menga', 'Progetto di Human-Computer Interaction focalizzato su preservazione e valorizzazione dei dialetti italiani attraverso esperienze di storytelling immersivo. Sviluppo completo del processo HCI: user research (5 interviste semi-strutturate), needfinding, sintesi di user needs, ideazione di soluzioni, creazione di prototipi cartacei e digitali (Figma), heuristic evaluation e redesign a media-alta fedeltà. Approccio user-centered orientato a bridging generazionale e reconnessione culturale.', 'Completato'),
('so-menga', 'en', 'So Menga', 'Human-Computer Interaction project focused on preserving and valorizing Italian dialects through immersive storytelling experiences. Complete HCI process: user research (5 semi-structured interviews), needfinding, user needs synthesis, solution ideation, paper and digital prototypes (Figma design), heuristic evaluation (53 violations identified), and medium-to-high fidelity redesign. User-centered approach addressing intergenerational bridge and cultural reconnection through authentic, contextualized learning.', 'Completed'),
('portfolio', 'it', 'Portfolio Personale Multilingua', 'Sito web portfolio sviluppato con React ed Express, featuring sistema multilingua completo e database SQLite per gestione dinamica dei contenuti.', 'Completato'),
('portfolio', 'en', 'Multilingual Personal Portfolio', 'Portfolio website built with React and Express, featuring complete multilingual system and SQLite database for dynamic content management.', 'Completed'),
('indovina-frase', 'it', 'Indovina la Frase', 'Applicazione web full-stack sviluppata come progetto d''esame per il corso di Applicazioni Web I. Gioco interattivo dove l''utente deve indovinare frasi selezionando le lettere corrette. Include sistema di autenticazione, gestione utenti, database SQLite e interfaccia React.', 'Completato'),
('indovina-frase', 'en', 'Guess the Phrase', 'Full-stack web application developed as exam project for Web Applications I course. Interactive game where users must guess phrases by selecting correct letters. Features authentication system, user management, SQLite database and React interface.', 'Completed');

INSERT OR IGNORE INTO project_technologies (project_id, technology) VALUES
('so-menga', 'User Research'),
('so-menga', 'Figma'),
('so-menga', 'Usability Testing'),
('so-menga', 'Prototyping'),
('so-menga', 'UX Design'),
('so-menga', 'HCI Methodology'),
('portfolio', 'JavaScript'),
('portfolio', 'React'),
('portfolio', 'Express'),
('portfolio', 'SQLite'),
('indovina-frase', 'JavaScript'),
('indovina-frase', 'React'),
('indovina-frase', 'Express'),
('indovina-frase', 'SQLite'),
('participium', 'Typescript'),
('participium', 'React'),
('participium', 'Leaflet.js'),
('participium', 'Express'),
('participium', 'TypeORM'),
('participium', 'PostgreSQL'),
('participium', 'MinIO'),
('participium', 'Telegram Bot API'),
('document-portal-ms', 'Kotlin'),
('document-portal-ms', 'Gradle'),
('document-portal-ms', 'Spring Boot'),
('document-portal-ms', 'Kafka'),
('document-portal-ms', 'TUS Protocol'),
('document-portal-ms', 'OAuth2/OIDC'),
('document-portal-ms', 'Keycloak'),
('document-portal-ms', 'AI Document Analysis'),
('document-portal-ms', 'Prometheus & Grafana'),
('document-portal-ms', 'PostgreSQL');

-- ================================
-- Courses + topics
-- ================================
INSERT OR IGNORE INTO courses (course_code, language, name, description, semester, year, credits, grade, url, is_featured) VALUES
('01UDFYG', 'it', 'Applicazioni Web I', 'Corso magistrale che presenta le principali tecniche per la realizzazione di applicazioni web, con focus sulla realizzazione di architetture frontend–backend con CORS.', '2°', 2025, 6, '30', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01UDFYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N', TRUE),
('01UDFYG', 'en', 'Web Applications I', 'Master’s course presenting the main techniques for developing web applications, with a focus on frontend–backend architectures using CORS.', '2nd', 2025, 6, '30', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01TXYYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N', TRUE),
('01SQMYG', 'it', 'Data Science e Tecnologie per le Basi di Dati', 'Corso che affronta gli aspetti fondamentali della tecnologia dei DBMS e le modalità di gestione delle basi di dati per l''analisi.', '1°', 2025, 8, '30L', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01SQMYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N', TRUE),
('01SQMYG', 'en', 'Data Science and Database Technologies', 'Course addressing fundamental aspects of DBMS technology and database management for data analysis.', '1st', 2025, 8, '30L', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01SQJYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N', TRUE);

INSERT OR IGNORE INTO course_topics (course_code, language, topic) VALUES
('01UDFYG', 'it', 'JavaScript Avanzato'),
('01UDFYG', 'it', 'React'),
('01UDFYG', 'it', 'Express'),
('01UDFYG', 'it', 'HTTP APIs'),
('01UDFYG', 'it', 'SQLite'),
('01UDFYG', 'it', 'Async Programming'),
('01UDFYG', 'it', 'Autenticazione & Autorizzazione'),
('01UDFYG', 'en', 'Advanced JavaScript'),
('01UDFYG', 'en', 'React'),
('01UDFYG', 'en', 'Express'),
('01UDFYG', 'en', 'HTTP APIs'),
('01UDFYG', 'en', 'SQLite'),
('01UDFYG', 'en', 'Async Programming'),
('01UDFYG', 'en', 'Authentication & Authorization'),
('01SQMYG', 'it', 'Sistemi DBMS Avanzati'),
('01SQMYG', 'it', 'Data Warehouse'),
('01SQMYG', 'it', 'NoSQL'),
('01SQMYG', 'it', 'Basi di Dati Distribuite'),
('01SQMYG', 'it', 'Classificazione & Clustering'),
('01SQMYG', 'en', 'Advanced DBMS Systems'),
('01SQMYG', 'en', 'Data Warehouse'),
('01SQMYG', 'en', 'NoSQL'),
('01SQMYG', 'en', 'Distributed Databases'),
('01SQMYG', 'en', 'Classification & Clustering');

-- ================================
-- Exams
-- ================================
INSERT OR IGNORE INTO exams (exam_code, language, name, degree_type, credits, grade, exam_date, url) VALUES
-- MAGISTRALE (IT)
('02JSKOV', 'it', 'Human Computer Interaction', 'magistrale', 6, '29', '2026-02-02', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=02JSKOV&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),
('02GOLYG', 'it', 'Architetture dei sistemi di elaborazione', 'magistrale', 10, '29', '2025-02-13', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=02GOLYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),
('01PDWYG', 'it', 'Information systems', 'magistrale', 6, '25', '2025-02-20', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01PDWYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),
('01VRYYG', 'it', 'Software engineering', 'magistrale', 8, '27', '2025-06-23', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01VRYYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),
('01SQMYG', 'it', 'Data Science e Tecnologie per le Basi di Dati', 'magistrale', 8, '30L', '2025-06-25', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01SQMYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),
('02JEUYG', 'it', 'Formal languages and compilers', 'magistrale', 6, '29', '2025-09-10', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=02JEUYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),
('01UDFYG', 'it', 'Applicazioni Web I', 'magistrale', 6, '30', '2025-09-17', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01UDFYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),

-- MAGISTRALE (EN)
('02JSKOV', 'en', 'Human Computer Interaction', 'magistrale', 6, '29', '2026-02-02', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=02JSKOV&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),
('02GOLYG', 'en', 'Computer System Architectures', 'magistrale', 10, '29', '2025-02-13', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=02LSEYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),
('01PDWYG', 'en', 'Information Systems', 'magistrale', 6, '25', '2025-02-20', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01PDWYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),
('01VRYYG', 'en', 'Software Engineering', 'magistrale', 8, '27', '2025-06-23', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01VRYYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),
('01SQMYG', 'en', 'Data Science and Database Technologies', 'magistrale', 8, '30L', '2025-06-25', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01SQJYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),
('02JEUYG', 'en', 'Formal Languages and Compilers', 'magistrale', 6, '29', '2025-09-10', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=02JEUYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),
('01UDFYG', 'en', 'Web Applications I', 'magistrale', 6, '30', '2025-09-17', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01TXYYG&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),

-- TRIENNALE (IT)
('14BHDOA', 'it', 'Informatica', 'triennale', 8, '30L', '2022-02-01', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=14BHDYE&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),
('16ACFOA', 'it', 'Analisi matematica I', 'triennale', 10, '22', '2022-02-10', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=16ACFYE&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),
('01FYZOA', 'it', 'Tecniche di programmazione', 'triennale', 6, '28', '2022-07-04', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01FYZYE&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),
('17AXOOA', 'it', 'Fisica I', 'triennale', 10, '23', '2022-07-07', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=17AXOYE&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),
('01RKCOA', 'it', 'Algebra lineare e geometria', 'triennale', 10, '26', '2022-09-15', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01RKCYE&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),
('26ACIOA', 'it', 'Analisi matematica II', 'triennale', 10, '21', '2023-02-02', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=26ACIYE&p_a_acc=2027&p_header=S&p_lang=IT&multi=N'),
('01URKOA', 'it', 'Elettromagnetismo e Teoria dei circuiti', 'triennale', 12, '25', '2023-02-24', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01URKYE&p_a_acc=2027&p_header=S&p_lang=IT&multi=N'),
('01DEIOA', 'it', 'Politica e tecnica (Grandi Sfide - Digitale)', 'triennale', 6, '26', '2023-06-19', 'https://didattica.polito.it/pls/portal30/sviluppo.guide.visualizza?p_cod_ins=01DEIYE&p_a_acc=2028&p_lang=IT'),
('12AGAOA', 'it', 'Calcolatori elettronici', 'triennale', 8, '19', '2023-06-23', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=12AGAYE&p_a_acc=2027&p_header=S&p_lang=IT&multi=N'),
('14AFQOA', 'it', 'Basi di dati', 'triennale', 8, '28', '2023-06-26', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=14AFQYE&p_a_acc=2027&p_header=S&p_lang=IT&multi=N'),
('09BQXOA', 'it', 'Metodi matematici per l''ingegneria', 'triennale', 10, '23', '2023-07-13', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=09BQXYE&p_a_acc=2027&p_header=S&p_lang=IT&multi=N'),
('15CDUOA', 'it', 'Reti di calcolatori', 'triennale', 8, '29', '2024-02-02', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=15CDUYE&p_a_acc=2028&p_header=S&p_lang=IT&multi=N'),
('05CJCOA', 'it', 'Sistemi operativi', 'triennale', 6, '26', '2024-02-07', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=05CJCYE&p_a_acc=2028&p_header=S&p_lang=IT&multi=N'),
('IAW001', 'it', 'Introduzione alle Applicazioni Web', 'triennale', 6, '28', '2024-02-09', 'https://didattica.polito.it/pls/portal30/sviluppo.guide.visualizza?p_cod_ins=01VRPYE&p_a_acc=2028'),
('TES001', 'it', 'Teoria ed elaborazione dei segnali', 'triennale', 8, '23', '2024-02-15', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=02MOOYE&p_a_acc=2028&p_header=S&p_lang=IT&multi=N'),
('05QXVOA', 'it', 'Sistemi elettronici, tecnologie e misure', 'triennale', 8, '20', '2024-03-01', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=05QXVOA&p_a_acc=2025&p_header=S&p_lang=IT&multi=N'),
('03MZGOA', 'it', 'Elettronica applicata', 'triennale', 8, '27', '2024-06-25', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=08ATIOA&p_a_acc=2025&p_header=S&p_lang=IT&multi=N'),
('04JEYOA', 'it', 'Programmazione a oggetti', 'triennale', 8, '24', '2024-07-03', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=09CBIYE&p_a_acc=2028&p_header=S&p_lang=IT&multi=N'),
('03AAXOA', 'it', 'Algoritmi e strutture dati', 'triennale', 8, '21', '2024-07-04', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=03AAXYE&p_a_acc=2027&p_header=S&p_lang=IT&multi=N'),
('18AKSOA', 'it', 'Controlli automatici', 'triennale', 10, '26', '2024-07-09', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=18AKSYE&p_a_acc=2028&p_header=S&p_lang=IT&multi=N'),
('15AHMOA', 'it', 'Chimica', 'triennale', 8, '29', '2025-01-31', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=15AHMYE&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),

-- TRIENNALE (EN)
('14BHDOA', 'en', 'Computer Science', 'triennale', 8, '30L', '2022-02-01', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=07JCJYF&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),
('16ACFOA', 'en', 'Mathematical Analysis I', 'triennale', 10, '22', '2022-02-10', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=04KWQYF&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),
('01FYZOA', 'en', 'Programming Techniques', 'triennale', 6, '28', '2022-07-04', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=02OJPYF&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),
('17AXOOA', 'en', 'Physics I', 'triennale', 10, '23', '2022-07-07', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=04KXVYF&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),
('01RKCOA', 'en', 'Linear Algebra and Geometry', 'triennale', 10, '26', '2022-09-15', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=03KXTYF&p_a_acc=2026&p_header=S&p_lang=IT&multi=N'),
('26ACIOA', 'en', 'Mathematical Analysis II', 'triennale', 10, '21', '2023-02-02', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=07KXUYF&p_a_acc=2027&p_header=S&p_lang=IT&multi=N'),
('01URKOA', 'en', 'Electromagnetism and Circuit Theory', 'triennale', 12, '25', '2023-02-24', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01URLYF&p_a_acc=2027&p_header=S&p_lang=IT&multi=N'),
('01DEIOA', 'en', 'Politics and Technology (Digital Challenges)', 'triennale', 6, '26', '2023-06-19', 'https://didattica.polito.it/pls/portal30/sviluppo.guide.visualizza?p_cod_ins=01DEIYE&p_a_acc=2028&p_lang=IT'),
('12AGAOA', 'en', 'Computer Architecture', 'triennale', 8, '19', '2023-06-23', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=02KTMYF&p_a_acc=2027&p_header=S&p_lang=IT&multi=N'),
('14AFQOA', 'en', 'Introduction to Databases', 'triennale', 8, '28', '2023-06-26', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01RKWYF&p_a_acc=2027&p_header=S&p_lang=IT&multi=N'),
('09BQXOA', 'en', 'Mathematical Methods for Engineering', 'triennale', 10, '23', '2023-07-13', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01UROYF&p_a_acc=2027&p_header=S&p_lang=IT&multi=N'),
('15CDUOA', 'en', 'Computer Networks', 'triennale', 8, '29', '2024-02-02', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=08KSIYE&p_a_acc=2028&p_header=S&p_lang=IT&multi=N'),
('05CJCOA', 'en', 'Operating Systems', 'triennale', 6, '26', '2024-02-07', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=04JEZYE&p_a_acc=2028&p_header=S&p_lang=IT&multi=N'),
('IAW001', 'en', 'Introduction to Web Applications', 'triennale', 6, '28', '2024-02-09', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01VRPYE&p_a_acc=2028&p_header=S&p_lang=IT&multi=N'),
('TES001', 'en', 'Signal Theory and Processing', 'triennale', 8, '23', '2024-02-15', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=02OGGYE&p_a_acc=2028&p_header=S&p_lang=IT&multi=N'),
('05QXVOA', 'en', 'Electronic Systems, Technologies and Measurements', 'triennale', 8, '20', '2024-03-01', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=06QXWOA&p_a_acc=2025&p_header=S&p_lang=IT&multi=N'),
('03MZGOA', 'en', 'Applied Electronics', 'triennale', 8, '27', '2024-06-25', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=03MZGOA&p_a_acc=2025&p_header=S&p_lang=IT&multi=N'),
('04JEYOA', 'en', 'Object-Oriented Programming', 'triennale', 8, '24', '2024-07-03', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=04JEYYE&p_a_acc=2028&p_header=S&p_lang=IT&multi=N'),
('03AAXOA', 'en', 'Algorithms and Data Structures', 'triennale', 8, '21', '2024-07-04', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=01URNYF&p_a_acc=2027&p_header=S&p_lang=IT&multi=N'),
('18AKSOA', 'en', 'Automatic Control', 'triennale', 10, '26', '2024-07-09', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=06LSLYE&p_a_acc=2028&p_header=S&p_lang=IT&multi=N'),
('15AHMOA', 'en', 'Chemistry', 'triennale', 8, '29', '2025-01-31', 'https://didattica.polito.it/pls/portal30/gap.pkg_guide.viewGap?p_cod_ins=06KWRYF&p_a_acc=2026&p_header=S&p_lang=IT&multi=N');

-- ================================
-- Certifications
-- ================================
INSERT OR IGNORE INTO certifications (certification_id, language, name, organization, description, level, date_obtained, is_featured) VALUES
('ielts-c1', 'it', 'IELTS Academic', 'British Council', 'Certificazione internazionale che attesta un livello avanzato di competenza nella lingua inglese (Common European Framework C1).', 'C1', '2024-05-15', TRUE),
('ielts-c1', 'en', 'IELTS Academic', 'British Council', 'International certification that attests an advanced level of English language proficiency (Common European Framework C1)', 'C1', '2024-05-15', TRUE);

-- ================================
-- Project images
-- ================================

INSERT OR IGNORE INTO project_images (project_id, image_path, alt_text, display_order, is_primary) VALUES
-- Images for "Indovina la Frase" / "Guess the Phrase"
('indovina-frase', 'guess-phrase-1.png', 'Guess the Phrase - Game interface', 0, TRUE),
('indovina-frase', 'guess-phrase-2.png', 'Guess the Phrase - Gameplay', 1, FALSE),

-- Images for "So Menga"
('so-menga', 'so-menga-1.png', 'So Menga - Main interface', 0, TRUE),
('so-menga', 'so-menga-2.png', 'So Menga - Feature showcase', 1, FALSE),

-- Images for "Participium"
('participium', 'participium-1.png', 'Participium - Interactive map with citizen reports', 0, TRUE),
('participium', 'participium-2.png', 'Participium - Report detail with chat system', 1, FALSE),
('participium', 'participium-3.png', 'Participium - Reports management dashboard', 2, FALSE);

COMMIT;
