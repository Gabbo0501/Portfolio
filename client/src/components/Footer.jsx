import { Container, Row, Col } from 'react-bootstrap';
import { useTranslation } from '../hooks/useTranslation';
import './Footer.css';

function Footer() {
  const currentYear = new Date().getFullYear();
  const { t } = useTranslation();

  return (
    <footer className="bg-dark text-white py-5">
      <Container>
        <Row className="g-4">
          
          <Col md={4}>
            <h5 className="fw-bold mb-3">{t('footer.quickLinks')}</h5>
            <ul className="list-unstyled">
              <li className="mb-2"><a href="#hero" className="text-light text-decoration-none hover-primary">{t('nav.home')}</a></li>
              <li className="mb-2"><a href="#about" className="text-light text-decoration-none hover-primary">{t('nav.about')}</a></li>
              <li className="mb-2"><a href="#courses" className="text-light text-decoration-none hover-primary">{t('nav.courses')}</a></li>
              <li className="mb-2"><a href="#projects" className="text-light text-decoration-none hover-primary">{t('nav.projects')}</a></li>
              <li className="mb-2"><a href="#skills" className="text-light text-decoration-none hover-primary">{t('nav.skills')}</a></li>
              <li className="mb-2"><a href="#contact" className="text-light text-decoration-none hover-primary">{t('nav.contact')}</a></li>
            </ul>
          </Col>
          
          <Col md={4}>
            <h5 className="fw-bold mb-3">{t('footer.social')}</h5>
            <ul className="list-unstyled">
              <li className="mb-2">
                <a 
                  href="https://github.com/gabriele" 
                  target="_blank" 
                  rel="noopener noreferrer"
                  className="text-light text-decoration-none hover-primary"
                >
                  <i className="bi bi-github me-2"></i>GitHub
                </a>
              </li>
              <li className="mb-2">
                <a 
                  href="https://linkedin.com/in/gabriele-studente" 
                  target="_blank" 
                  rel="noopener noreferrer"
                  className="text-light text-decoration-none hover-primary"
                >
                  <i className="bi bi-linkedin me-2"></i>LinkedIn
                </a>
              </li>
              <li className="mb-2">
                <a 
                  href="mailto:gabriele.studente@example.com"
                  className="text-light text-decoration-none hover-primary"
                >
                  <i className="bi bi-envelope me-2"></i>Email
                </a>
              </li>
            </ul>
          </Col>
        </Row>
        
        <hr className="my-4" />
        
        <Row>
          <Col className="text-center">
            <p className="mb-2 text-light">&copy; {currentYear} Mondino Gabriele. {t('footer.rights')}</p>
          </Col>
        </Row>
      </Container>
    </footer>
  );
}

export default Footer;