import axios from 'axios';

// Prefer a configurable base URL via Vite env; default to relative '/api' so
// production behind the reverse proxy works without hardcoding localhost.
const API_BASE_URL = import.meta?.env?.VITE_API_BASE || '/api';

const api = axios.create({
  baseURL: API_BASE_URL,
  headers: {
    'Content-Type': 'application/json',
  },
});

export const portfolioAPI = {

  getPortfolioData: async (language = 'it') => {
    try {
      const response = await api.get(`/portfolio/${language}`);
      return response.data;
    } catch (error) {
      throw error;
    }
  },

};

export default api;