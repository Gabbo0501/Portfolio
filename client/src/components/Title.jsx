import { useState, useEffect } from 'react';
import { Container, Row, Col, Spinner, Alert } from 'react-bootstrap';
import { portfolioAPI } from '../services/api';
import { useTranslation } from '../hooks/useTranslation';
import { useLanguage } from '../contexts/LanguageContext';
import './Title.css';

function Title() {
  const [portfolioData, setPortfolioData] = useState(null);
  const [loading, setLoading] = useState(true);
  const { t } = useTranslation();
  const { language, toggleLanguage } = useLanguage();

  useEffect(() => {
    const fetchData = async () => {
      try {
        const data = await portfolioAPI.getPortfolioData(language);
        setPortfolioData(data);
      } catch (error) {
        console.error('Error loading portfolio data:', error);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [language]); // Re-fetch when language changes

  const scrollToSection = (sectionId) => {
    const element = document.getElementById(sectionId);
    if (element) {
      element.scrollIntoView({ 
        behavior: 'smooth',
        block: 'start'
      });
    }
  };

  if (loading) {
    return (
      <section id="home" className="title-section">
        <div className="animated-background">
          <div className="grid-pattern"></div>
        </div>
        <Container className="text-center title-loading">
          <div className="loading-spinner">
            <div className="spinner-ring"></div>
            <div className="spinner-ring"></div>
            <div className="spinner-ring"></div>
          </div>
          <p className="loading-text">{t('common.loading')}</p>
        </Container>
      </section>
    );
  }

  if (!portfolioData) {
    return (
      <section id="home" className="title-section">
        <Container>
          <Alert variant="danger">{t('common.error')}</Alert>
        </Container>
      </section>
    );
  }

  const { personalInfo } = portfolioData;

  return (
    <section id="home" className="title-section">
      {/* Animated Background */}
      <div className="animated-background">
        <div className="grid-pattern"></div>
      </div>

      {/* Static Navigation */}
      <nav className="static-nav">
        <div className="nav-container">
          {[
            { id: 'home', icon: 'house', label: t('nav.home') },
            { id: 'about', icon: 'person', label: t('nav.about') },
            { id: 'courses', icon: 'mortarboard', label: t('nav.courses') },
            { id: 'projects', icon: 'briefcase', label: t('nav.projects') },
            { id: 'skills', icon: 'tools', label: t('nav.skills') },
            { id: 'contact', icon: 'envelope', label: t('nav.contact') }
          ].map((item, index) => (
            <div key={item.id} className="nav-item" style={{ '--delay': `${index * 0.1}s` }}>
              <button 
                className="nav-btn"
                onClick={() => scrollToSection(item.id)}
                title={item.label}
              >
                <i className={`bi bi-${item.icon}`}></i>
              </button>
            </div>
          ))}
          
          {/* Language Toggle */}
          <div className="nav-item language-toggle" style={{ '--delay': '0.6s' }}>
            <button 
              className="nav-btn language-btn"
              onClick={toggleLanguage}
              title={language === 'it' ? 'Switch to English' : 'Passa all\'Italiano'}
            >
              <span className="flag-icon">
                {language === 'it' ? '🇮🇹' : '🇬🇧'}
              </span>
            </button>
          </div>
        </div>
      </nav>

      {/* Hero Content */}
      <div className="hero-content">
        <Container>
          <Row className="justify-content-center">
            <Col lg={12} xl={10}>
              
              {/* Greeting */}
              <div className="hero-greeting">
                <span className="greeting-text">{t('title.greeting')}</span>
              </div>
              
              {/* Main Name with Animated Underline */}
              <div className="hero-name">
                <h1 className="name-text">
                  {personalInfo.name.split(' ').map((word, index) => (
                    <span key={index} className="name-word" style={{ '--delay': `${index * 0.2}s` }}>
                      {word}
                    </span>
                  ))}
                </h1>
                <div className="name-underline"></div>
              </div>
              
              {/* Role with Icon */}
              <div className="hero-role">
                <div className="role-container">
                  <div className="role-icon">
                    <i className="bi bi-code-slash"></i>
                  </div>
                  <h2 className="role-text">
                    {t('title.role')}
                  </h2>
                </div>
              </div>
              
              {/* Description */}
              <div className="hero-description">
                <p className="description-text">
                  <span className="typing-text">{t('title.description')}</span>
                </p>
              </div>

              {/* CTA Buttons */}
              <div className="hero-actions">
                <button 
                  className="cta-btn primary"
                  onClick={() => scrollToSection('projects')}
                >
                  <span className="btn-text">{t('title.viewWork')}</span>
                  <i className="bi bi-arrow-right"></i>
                </button>
                <button 
                  className="cta-btn secondary"
                  onClick={() => scrollToSection('contact')}
                >
                  <span className="btn-text">{t('title.getInTouch')}</span>
                  <i className="bi bi-chat-dots"></i>
                </button>
              </div>
              
            </Col>
          </Row>
        </Container>
      </div>
    </section>
  );
}

export default Title;