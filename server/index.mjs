import express from 'express';
import cors from 'cors';
import morgan from 'morgan';
import { getPortfolioData } from './dao.mjs';

const app = express();
const PORT = process.env.PORT || 3001;

app.use(cors());
app.use(morgan('dev'));
app.use(express.json());

app.get('/api/portfolio/:lang', async (req, res) => {
  try {
    const language = req.params.lang;
    
    if (!['it', 'en'].includes(language)) {
      return res.status(400).json({ 
        error: 'Supported languages: it, en' 
      });
    }
    
    const portfolioData = await getPortfolioData(language);
    res.json(portfolioData);
  } catch (error) {
    console.error('Error fetching portfolio data:', error);
    res.status(500).json({ 
      error: req.params.lang === 'it' ? 'Errore nel caricamento dei dati' : 'Error loading data' 
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