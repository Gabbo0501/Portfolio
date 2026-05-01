import { useState } from 'react';
import { LanguageContext } from './LanguageContextCore';

export const LanguageProvider = ({ children }) => {
  const [language, setLanguage] = useState('it'); // Default: italiano

  const toggleLanguage = () => {
    setLanguage((prev) => (prev === 'it' ? 'en' : 'it'));
  };

  const value = {
    language,
    setLanguage,
    toggleLanguage,
    isItalian: language === 'it',
    isEnglish: language === 'en',
  };

  return <LanguageContext.Provider value={value}>{children}</LanguageContext.Provider>;
};
