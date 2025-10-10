import { useState, useEffect } from 'react';
import { Container, Row, Col } from 'react-bootstrap';
import { portfolioAPI } from '../services/api';
import { useTranslation } from '../hooks/useTranslation';
import { useLanguage } from '../contexts/LanguageContext';
import './Projects.css';

function Projects() {
  const [projects, setProjects] = useState([]);
  const [loading, setLoading] = useState(true);
  const { t } = useTranslation();
  const { language } = useLanguage();

  useEffect(() => {
    const fetchData = async () => {
      try {
        const data = await portfolioAPI.getPortfolioData(language);
        setProjects(data.projects);
      } catch (error) {
        console.error('Error loading projects:', error);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [language]); // Re-fetch when language changes

  if (loading) {
    return (
      <section id="projects" className="projects-section">
        <Container className="projects-loading">
          <div className="loading-spinner"></div>
          <div className="loading-text">{t('common.loading')}</div>
        </Container>
      </section>
    );
  }

  return (
    <section id="projects" className="projects-section">
      <Container>
        <Row className="mb-5 mt-4">
          <Col>
            <h2 className="projects-title">{t('projects.title')}</h2>
            <p className="projects-intro">
              {t('projects.description')}
            </p>
          </Col>
        </Row>
        
        <div className="projects-grid">
          {projects.map((project, index) => (
            <div key={project.id} className="project-card" style={{ '--index': index }}>
              <div className="project-image">
                <div className="project-placeholder">
                  <i className="bi bi-code-slash"></i>
                </div>
              </div>
              
              <div className="project-content">
                <div className="project-header">
                  <h3 className="project-title">{project.name}</h3>
                  <span className={`project-status status-${
                    (project.status === 'Completato' || project.status === 'Completed') ? 'completato' : 
                    (project.status === 'In Sviluppo' || project.status === 'In Development') ? 'in-sviluppo' : 'in-progress'
                  }`}>
                    {project.status}
                  </span>
                </div>
                
                <p className="project-description">{project.description}</p>
                
                <div className="project-technologies">
                  <div className="tech-list">
                    {project.technologies.map(tech => (
                      <span key={tech} className="tech-badge">
                        {tech}
                      </span>
                    ))}
                  </div>
                </div>
                
                <div className="project-links">
                  {project.github && (
                    <a 
                      href={project.github} 
                      target="_blank" 
                      rel="noopener noreferrer"
                      className="project-link github-link"
                    >
                      <i className="bi bi-github"></i>
                      {t('projects.code')}
                    </a>
                  )}
                </div>
              </div>
            </div>
          ))}
        </div>
      </Container>
    </section>
  );
}

export default Projects;