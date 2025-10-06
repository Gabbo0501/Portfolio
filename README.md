# Portfolio Studente Universitario

Un portfolio web single-page per studenti universitari di Informatica, sviluppato con React (frontend) e Express (backend).

## 🚀 Tecnologie Utilizzate

### Frontend
- **React** - Libreria JavaScript per l'interfaccia utente
- **Vite** - Build tool veloce per lo sviluppo
- **Axios** - Client HTTP per le chiamate API
- **CSS3** - Styling moderno e responsive con gradients e animazioni

### Backend
- **Node.js** - Runtime JavaScript
- **Express** - Framework web per Node.js
- **CORS** - Middleware per cross-origin requests
- **Morgan** - Logger HTTP

## 📁 Struttura del Progetto

```
portfolio/
├── client/                 # Frontend React (Single Page)
│   ├── src/
│   │   ├── components/     # Hero, About, Courses, Projects, Skills, Contact
│   │   ├── services/       # API per comunicazione con server
│   │   └── App.jsx        # App principale single-page
│   └── package.json
├── server/                 # Backend Express API
│   ├── index.mjs          # Server con dati portfolio
│   └── package.json
├── .vscode/               # Task VS Code
└── README.md
```

## 🛠️ Installazione e Avvio

### Prerequisiti
- Node.js (versione 16 o superiore)
- npm

### 1. Installa le dipendenze

```bash
# Server
cd server
npm install

# Client  
cd ../client
npm install
```

### 2. Avvia l'applicazione

Opzione 1 - Task VS Code (Raccomandato):
- Apri il progetto in VS Code
- Vai su Terminal → Run Task → "Start Portfolio (Server + Client)"

Opzione 2 - Terminali separati:
```bash
# Terminal 1 - Server (porta 3001)
cd server
npm run dev

# Terminal 2 - Client (porta 5173)
cd client
npm run dev
```

## 📖 Sezioni del Portfolio

### 🏠 Hero Section
- Presentazione personale
- Call-to-action buttons con smooth scrolling

### 👨‍🎓 Chi Sono
- Biografia dello studente
- Informazioni di contatto
- Percorso formativo
- Interessi e obiettivi

### 📚 Corsi Universitari
- Lista corsi sostenuti con voti
- Codici corso e CFU
- Argomenti trattati
- Statistiche accademiche

### 🚀 Progetti
- Portfolio progetti universitari e personali
- Tecnologie utilizzate
- Link a repository GitHub
- Status del progetto

### 💻 Competenze Tecniche
- Linguaggi di programmazione
- Frameworks e librerie
- Tools e metodologie
- Obiettivi di apprendimento

### 📧 Contatti
- Form di contatto funzionale
- Informazioni di contatto
- Link social

## 🎨 Caratteristiche Design

- **Single Page Application** - Navigazione fluida con smooth scrolling
- **Responsive Design** - Ottimizzato per tutti i dispositivi
- **Gradients Moderni** - Design colorato e accattivante
- **Animazioni CSS** - Hover effects e transizioni
- **Layout Professionale** - Perfetto per studenti universitari

## 🔧 Personalizzazione

Per adattare il portfolio ai tuoi dati:

1. **Dati Personali**: Modifica `server/index.mjs` - sezione `personalInfo`
2. **Corsi**: Aggiorna array `courses` con i tuoi esami
3. **Progetti**: Sostituisci array `projects` con i tuoi lavori
4. **Competenze**: Modifica array `skills` con le tue tecnologie
5. **Colori**: Personalizza i gradients nei file CSS
6. **Contatti**: Aggiorna email e link social

## 📱 API Endpoints

- `GET /api/portfolio` - Tutti i dati del portfolio
- `POST /api/contact` - Invio messaggi dal form contatti  
- `GET /api/health` - Health check server

## 🚀 Deploy

### Client (Frontend)
- **Vercel** - Deploy automatico da GitHub
- **Netlify** - Hosting statico
- **GitHub Pages** - Gratuito per progetti pubblici

### Server (Backend)  
- **Railway** - Deploy facile per Node.js
- **Render** - Piano gratuito disponibile
- **Heroku** - Piattaforma consolidata

## 📝 Utilizzo Accademico

Questo portfolio è ideale per:
- Studenti di Informatica / Ingegneria del Software
- Progetti universitari di Programmazione Web
- Tirocini e stage in aziende tech
- Presentazioni durante colloqui di lavoro
- Candidature per master/dottorati

## 📞 Supporto

**Gabriele** - [gabriele.studente@example.com](mailto:gabriele.studente@example.com)

## 🙏 Tecnologie e Risorse

- [React](https://reactjs.org/) - UI Library
- [Express](https://expressjs.com/) - Web Framework
- [Vite](https://vitejs.dev/) - Build Tool
- Design ispirato a portfolio universitari moderni