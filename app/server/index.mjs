import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import rateLimit from 'express-rate-limit';
import morgan from 'morgan';
import path from 'path';
import { fileURLToPath } from 'url';
import { getPortfolioData } from './dao.mjs';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const PORT = process.env.PORT || 3001;
const isProduction = process.env.NODE_ENV === 'production';
const corsOrigins = (process.env.CORS_ORIGINS || '')
  .split(',')
  .map((origin) => origin.trim())
  .filter(Boolean);

const corsOptions = isProduction
  ? {
      origin(origin, callback) {
        if (!origin || corsOrigins.includes(origin)) {
          return callback(null, true);
        }

        return callback(new Error('Origin not allowed by CORS'));
      },
    }
  : {};

const apiLimiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  limit: 100,
  standardHeaders: 'draft-8',
  legacyHeaders: false,
});

app.use(helmet());
app.use(cors(corsOptions));
app.use(morgan('dev'));
app.use(express.json());
app.use('/api', apiLimiter);

// Serve static images
app.use('/images', express.static(path.join(__dirname, 'public/images')));

app.get('/api/portfolio/:lang', async (req, res) => {
  try {
    const language = req.params.lang;

    if (!['it', 'en'].includes(language)) {
      return res.status(400).json({
        error: 'Supported languages: it, en',
      });
    }

    const portfolioData = await getPortfolioData(language);
    res.json(portfolioData);
  } catch (error) {
    console.error('Error fetching portfolio data:', error);
    res.status(500).json({
      error: req.params.lang === 'it' ? 'Errore nel caricamento dei dati' : 'Error loading data',
    });
  }
});

// Graceful shutdown
process.on('SIGINT', async () => {
  console.log('Shutting down server...');
  process.exit(0);
});

app.listen(PORT, () => {
  console.log(`Server in esecuzione sulla porta ${PORT}`);
});
