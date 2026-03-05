import { useState, useEffect, useRef } from 'react';
import { Container, Row, Col } from 'react-bootstrap';
import { portfolioAPI } from '../services/api';
import { useTranslation } from '../hooks/useTranslation';
import { useLanguage } from '../contexts/LanguageContext';
import './Projects.css';

function Projects() {
  const [projects, setProjects] = useState([]);
  const [loading, setLoading] = useState(true);
  const [lightboxProject, setLightboxProject] = useState(null); // Track which project lightbox is open
  const [lightboxImageIndex, setLightboxImageIndex] = useState(0); // Track active image in lightbox
  const { t } = useTranslation();
  const { language } = useLanguage();

  // API base URL for images
  const API_BASE = import.meta?.env?.VITE_API_BASE || 'http://localhost:3001';

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

  const openLightbox = (project) => {
    const primaryIndex = project.images.findIndex(img => img.isPrimary);
    setLightboxImageIndex(primaryIndex >= 0 ? primaryIndex : 0);
    setLightboxProject(project);
    prevActiveElementRef.current = document.activeElement;
    // slight delay so the modal markup is mounted before focusing
    setTimeout(() => {
      const btn = document.querySelector('.lightbox-close');
      if (btn) btn.focus();
    }, 0);
    document.body.style.overflow = 'hidden'; // Prevent background scrolling
  };

  const closeLightbox = () => {
    setLightboxProject(null);
    setLightboxImageIndex(0);
    document.body.style.overflow = 'auto';
    // restore focus to previous element
    if (prevActiveElementRef.current && typeof prevActiveElementRef.current.focus === 'function') {
      prevActiveElementRef.current.focus();
    }
  };

  const nextImage = () => {
    if (lightboxProject && lightboxProject.images) {
      setLightboxImageIndex((prev) => 
        prev < lightboxProject.images.length - 1 ? prev + 1 : 0
      );
    }
  };

  const prevImage = () => {
    if (lightboxProject && lightboxProject.images) {
      setLightboxImageIndex((prev) => 
        prev > 0 ? prev - 1 : lightboxProject.images.length - 1
      );
    }
  };

  const goToImage = (index) => {
    setLightboxImageIndex(index);
  };

  // Accessibility: focus trap and ESC handler
  const prevActiveElementRef = useRef(null);

  useEffect(() => {
    if (!lightboxProject) return;

    const onKeyDown = (e) => {
      if (e.key === 'Escape') {
        e.preventDefault();
        closeLightbox();
        return;
      }

      if (e.key === 'ArrowLeft') {
        e.preventDefault();
        prevImage();
        return;
      }

      if (e.key === 'ArrowRight') {
        e.preventDefault();
        nextImage();
        return;
      }

      if (e.key === 'Tab') {
        // trap focus inside modal
        const container = document.querySelector('.lightbox-content');
        if (!container) return;
        const focusable = container.querySelectorAll('button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])');
        const focusableArr = Array.prototype.slice.call(focusable).filter(el => !el.hasAttribute('disabled'));
        if (focusableArr.length === 0) {
          e.preventDefault();
          return;
        }
        const first = focusableArr[0];
        const last = focusableArr[focusableArr.length - 1];

        if (e.shiftKey) {
          if (document.activeElement === first) {
            e.preventDefault();
            last.focus();
          }
        } else {
          if (document.activeElement === last) {
            e.preventDefault();
            first.focus();
          }
        }
      }
    };

    document.addEventListener('keydown', onKeyDown);
    return () => document.removeEventListener('keydown', onKeyDown);
  }, [lightboxProject]);

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
          {projects.map((project, index) => {
            const hasImages = project.images && project.images.length > 0;
            const primaryImage = hasImages 
              ? project.images.find(img => img.isPrimary) || project.images[0]
              : null;
            
            return (
            <div key={project.id} className="project-card" style={{ '--index': index }}>
              <div 
                className="project-image" 
                onClick={() => hasImages && openLightbox(project)}
                style={{ cursor: hasImages ? 'pointer' : 'default' }}
              >
                {hasImages ? (
                  <>
                    <img 
                      src={`${API_BASE}/images/projects/${primaryImage.path}`}
                      alt={primaryImage.alt}
                      className="project-img"
                      onError={(e) => {
                        e.target.style.display = 'none';
                        e.target.parentElement.querySelector('.project-placeholder')?.classList.remove('hidden');
                      }}
                    />
                    <div className="project-placeholder hidden">
                      <i className="bi bi-code-slash"></i>
                    </div>
                    {project.images.length > 1 && (
                      <div className="image-count-badge">
                        <i className="bi bi-images"></i> {project.images.length}
                      </div>
                    )}
                  </>
                ) : (
                  <div className="project-placeholder">
                    <i className="bi bi-code-slash"></i>
                  </div>
                )}
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
            );
          })}
        </div>
      </Container>
      {/* Lightbox Modal */}
      {lightboxProject && (
        <div className="lightbox-overlay" onClick={closeLightbox}>
          <div className="lightbox-content" onClick={(e) => e.stopPropagation()}>
            <button className="lightbox-close" onClick={closeLightbox} aria-label="Close">
              <i className="bi bi-x-lg"></i>
            </button>
            
            <div className="lightbox-image-container">
              {lightboxProject.images && lightboxProject.images[lightboxImageIndex] && (
                <img 
                  src={`${API_BASE}/images/projects/${lightboxProject.images[lightboxImageIndex].path}`}
                  alt={lightboxProject.images[lightboxImageIndex].alt}
                  className="lightbox-img"
                />
              )}
              
              {lightboxProject.images && lightboxProject.images.length > 1 && (
                <>
                  <button 
                    className="lightbox-nav prev"
                    onClick={prevImage}
                    aria-label="Previous image"
                  >
                    <i className="bi bi-chevron-left"></i>
                  </button>
                  <button 
                    className="lightbox-nav next"
                    onClick={nextImage}
                    aria-label="Next image"
                  >
                    <i className="bi bi-chevron-right"></i>
                  </button>
                </>
              )}
            </div>
            
            <div className="lightbox-info">
              <h3 className="lightbox-title">{lightboxProject.name}</h3>
              {lightboxProject.images && lightboxProject.images.length > 1 && (
                <div className="lightbox-indicators">
                  {lightboxProject.images.map((_, imgIndex) => (
                    <button
                      key={imgIndex}
                      className={`lightbox-indicator ${imgIndex === lightboxImageIndex ? 'active' : ''}`}
                      onClick={() => goToImage(imgIndex)}
                      aria-label={`View image ${imgIndex + 1}`}
                    />
                  ))}
                </div>
              )}
              <p className="lightbox-counter">
                {lightboxImageIndex + 1} / {lightboxProject.images?.length || 0}
              </p>
            </div>
          </div>
        </div>
      )}    </section>
  );
}

export default Projects;