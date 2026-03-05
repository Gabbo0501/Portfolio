import { useState, useEffect } from 'react';
import { Container, Row, Col } from 'react-bootstrap';
import { portfolioAPI } from '../services/api';
import { useTranslation } from '../hooks/useTranslation';
import { useLanguage } from '../contexts/LanguageContext';
import { useScrollReveal } from '../hooks/useScrollReveal';
import './Skills.css';

function Skills() {
  const [skills, setSkills] = useState([]);
  const [loading, setLoading] = useState(true);
  const { t } = useTranslation();
  const { language } = useLanguage();
  const sectionRef = useScrollReveal([loading]);

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
      'frontend': 'bi-display',
      'backend': 'bi-pc',
      'persistency': 'bi-database',
      'strumenti,devopseinifrastruttura': 'bi-gear-wide-connected',  // IT: Strumenti e Infrastruttura
      'tools,devops&infrastructure': 'bi-gear-wide-connected',       // EN: Tools & Infrastructure
      'designeuxresearch': 'bi-brush',                 // IT: Design e UX Research
      'design&uxresearch': 'bi-brush',                 // EN: Design & UX Research
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
    <section id="skills" className="skills-section" ref={sectionRef}>
      <Container>
        <Row className="mb-5">
          <Col>
            <h2 className="skills-title reveal">{t('skills.title')}</h2>
            <p className="skills-intro reveal" style={{ '--index': 1 }}>
              {t('skills.description')}
            </p>
          </Col>
        </Row>

        <div className="skills-grid">
          {skills.map((skillCategory, index) => (
            <div 
              key={index} 
              className="skill-category-card reveal" 
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