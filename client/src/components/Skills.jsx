import { useState, useEffect } from 'react';
import { Container, Row, Col } from 'react-bootstrap';
import { portfolioAPI } from '../services/api';
import { useTranslation } from '../hooks/useTranslation';
import { useLanguage } from '../contexts/LanguageContext';
import './Skills.css';

function Skills() {
  const [skills, setSkills] = useState([]);
  const [loading, setLoading] = useState(true);
  const { t } = useTranslation();
  const { language } = useLanguage();

  useEffect(() => {
    const fetchData = async () => {
      try {
        const data = await portfolioAPI.getPortfolioData(language);
        setSkills(data.skills);
      } catch (error) {
        console.error('Error loading skills:', error);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [language]); // Re-fetch when language changes

  // Category icon mapping
  const getCategoryIcon = (category) => {
    const iconMap = {
      'frontend': 'bi-palette',
      'backend': 'bi-server',
      'database': 'bi-database',
      'tools': 'bi-gear-wide-connected',
      'strumentietecnologie': 'bi-gear-wide-connected',
      'mobile': 'bi-phone',
      'cloud': 'bi-cloud',
      'languages': 'bi-globe',
      'lingue': 'bi-globe',
      'default': 'bi-code-square'
    };
    
    const categoryKey = category.toLowerCase().replace(/\s+/g, '');
    return iconMap[categoryKey] || iconMap.default;
  };

  if (loading) {
    return (
      <section id="skills" className="skills-section">
        <Container className="skills-loading">
          <div className="loading-spinner"></div>
          <div className="loading-text">{t('common.loading')}</div>
        </Container>
      </section>
    );
  }

  return (
    <section id="skills" className="skills-section">
      <Container>
        <Row className="mb-5">
          <Col>
            <h2 className="skills-title">{t('skills.title')}</h2>
            <p className="skills-intro">
              {t('skills.description')}
            </p>
          </Col>
        </Row>

        <div className="skills-grid">
          {skills.map((skillCategory, index) => (
            <div 
              key={index} 
              className="skill-category-card" 
              style={{ '--index': index }}
              data-category={skillCategory.category.toLowerCase().replace(/\s+/g, '')}
            >
              <div className="skill-category-header">
                <div className="skill-category-icon">
                  <i className={getCategoryIcon(skillCategory.category)}></i>
                </div>
                <h3 className="skill-category-title">
                  {skillCategory.category}
                </h3>
              </div>
              
              <div className="skill-technologies">
                {skillCategory.technologies.map((tech, techIndex) => (
                  <span 
                    key={techIndex} 
                    className="skill-tech-badge"
                  >
                    {tech}
                  </span>
                ))}
              </div>
            </div>
          ))}
        </div>
      </Container>
    </section>
  );
}

export default Skills;