import { useContext } from 'react';
import { PortfolioDataContext } from '../contexts/PortfolioDataContextCore';

export const usePortfolioData = () => {
  const context = useContext(PortfolioDataContext);

  if (!context) {
    throw new Error('usePortfolioData must be used within a PortfolioDataProvider');
  }

  return context;
};
