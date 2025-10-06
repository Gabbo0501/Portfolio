import { useLanguage } from '../contexts/LanguageContext';
import { translations } from '../utils/translations';

export const useTranslation = () => {
  const { language } = useLanguage();

  const t = (key) => {
    const keys = key.split('.');
    let translation = translations[language];
    
    for (const k of keys) {
      if (translation && translation[k]) {
        translation = translation[k];
      } else {
        console.warn(`Translation missing for key: ${key} in language: ${language}`);
        return key; // Return the key if translation is missing
      }
    }
    
    return translation;
  };

  return { t, language };
};