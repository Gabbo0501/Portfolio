import { Container, Row, Col } from 'react-bootstrap';
import { useTranslation } from '../hooks/useTranslation';
import { useScrollReveal } from '../hooks/useScrollReveal';
import { usePortfolioData } from '../hooks/usePortfolioData';
import './Skills.css';

function Skills() {
  const { t } = useTranslation();
  const { portfolioData, loading } = usePortfolioData();
  const skills = portfolioData?.skills || [];
  const sectionRef = useScrollReveal([loading]);

  // Category icon mapping
  const getCategoryIcon = (categoryId) => {
    const iconMap = {
      frontend: 'bi-display',
      backend: 'bi-pc',
      persistency: 'bi-database',
      design: 'bi-brush',
      mobile: 'bi-phone',
      languages: 'bi-globe',
      default: 'bi-code-square',
    };

    return iconMap[categoryId] || iconMap.default;
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
              data-category={skillCategory.categoryId}
            >
              <div className="skill-category-header">
                <div className="skill-category-icon">
                  <i className={getCategoryIcon(skillCategory.categoryId)}></i>
                </div>
                <h3 className="skill-category-title">{skillCategory.category}</h3>
              </div>

              <div className="skill-technologies">
                {skillCategory.technologies.map((tech, techIndex) => (
                  <span key={techIndex} className="skill-tech-badge">
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
