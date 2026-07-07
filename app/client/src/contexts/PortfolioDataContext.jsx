import { useEffect, useState } from 'react';
import { PortfolioDataContext } from './PortfolioDataContextCore';
import { useLanguage } from '../hooks/useLanguage';
import { portfolioAPI } from '../services/api';

export const PortfolioDataProvider = ({ children }) => {
  const { language } = useLanguage();
  const [portfolioData, setPortfolioData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    let cancelled = false;

    const fetchData = async () => {
      setLoading(true);
      setError(null);

      try {
        const data = await portfolioAPI.getPortfolioData(language);
        if (!cancelled) {
          setPortfolioData(data);
        }
      } catch (err) {
        console.error('Error loading portfolio data:', err);
        if (!cancelled) {
          setPortfolioData(null);
          setError(err);
        }
      } finally {
        if (!cancelled) {
          setLoading(false);
        }
      }
    };

    fetchData();

    return () => {
      cancelled = true;
    };
  }, [language]);

  const value = {
    portfolioData,
    loading,
    error,
  };

  return <PortfolioDataContext.Provider value={value}>{children}</PortfolioDataContext.Provider>;
};
