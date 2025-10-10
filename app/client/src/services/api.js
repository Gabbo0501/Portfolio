import axios from 'axios';

const API_BASE_URL = 'http://localhost:3001/api';

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