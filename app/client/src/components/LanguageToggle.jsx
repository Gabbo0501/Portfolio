import { useLanguage } from '../contexts/LanguageContext';
import './LanguageToggle.css';

function LanguageToggle() {
  const { language, toggleLanguage } = useLanguage();

  return (
    <div className="language-toggle">
      <button
        className="language-btn"
        onClick={toggleLanguage}
        title={language === 'it' ? 'Switch to English' : 'Passa all\'Italiano'}
      >
        <div className="flag-container">
          <span className={`flag-icon ${language === 'it' ? 'flag-it' : 'flag-en'}`}>
            {language === 'it' ? '🇮🇹' : '🇬🇧'}
          </span>
        </div>
        <span className="language-text">
          {language === 'it' ? 'IT' : 'EN'}
        </span>
      </button>
    </div>
  );
}

export default LanguageToggle;