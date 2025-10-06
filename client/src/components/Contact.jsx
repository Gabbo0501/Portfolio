import { Container, Row, Col } from 'react-bootstrap';
import { useEffect, useState } from 'react';
import { useTranslation } from '../hooks/useTranslation';
import { portfolioAPI } from '../services/api';
import './Contact.css';

function Contact() {
  const { t, language } = useTranslation();
  const [personal, setPersonal] = useState(null);

  useEffect(() => {
    let mounted = true;
    (async () => {
      try {
        const data = await portfolioAPI.getPortfolioData(language);
        if (mounted) setPersonal(data.personalInfo || null);
      } catch (err) {
        console.error('Unable to load personal info for contact', err);
      }
    })();

    return () => { mounted = false; };
  }, [language]);

  const name = personal?.name;
  const email = personal?.email;
  const linkedin = personal?.linkedin;
  const location = personal?.location;
  const github = personal?.github;

  // Safe hrefs and display values
  const emailUrl = `mailto:${email || 'gabrielemondino05@gmail.com'}`;
  const linkedinUrl = linkedin || 'https://linkedin.com/in/gabriele-studente';
  const githubUrl = github || 'https://github.com/Gabbo0501';
  const githubHandle = githubUrl.replace(/^https?:\/\/(www\.)?github\.com\//i, '');

  return (
    <section id="contact" className="contact-section">
      <Container>
        <Row className="mb-5">
          <Col>
            <h2 className="contact-title text-center">{t('contact.title')}</h2>
          </Col>
        </Row>
        
        <Row className="justify-content-center">
          <Col lg={10} xl={8}>
            <Row className="g-4">
              <Col md={6}>
                <div className="contact-item" style={{ '--index': 0 }}>
                  <a className="contact-icon" href={emailUrl}>
                    <i className="bi bi-envelope"></i>
                  </a>
                  <div className="contact-info">
                    <h5>{t('contact.emailTitle')}</h5>
                    <p><a href={emailUrl}>{email || 'gabrielemondino05@gmail.com'}</a></p>
                  </div>
                </div>
              </Col>
              
              <Col md={6}>
                <div className="contact-item" style={{ '--index': 1 }}>
                  <a className="contact-icon" href={linkedinUrl} target="_blank" rel="noopener noreferrer">
                    <i className="bi bi-linkedin"></i>
                  </a>
                  <div className="contact-info">
                    <h5>{t('contact.linkedinTitle')}</h5>
                    <p>
                      <a href={linkedinUrl} target="_blank" rel="noopener noreferrer">{name || linkedinUrl.replace(/^https?:\/\/(www\.)?linkedin\.com\//i, '')}</a>
                    </p>
                  </div>
                </div>
              </Col>
              
              <Col md={6}>
                <div className="contact-item" style={{ '--index': 2 }}>
                  <div className="contact-icon">
                    <i className="bi bi-geo-alt"></i>
                  </div>
                  <div className="contact-info">
                    <h5>{t('contact.locationTitle')}</h5>
                    <p>{location}</p>
                  </div>
                </div>
              </Col>
              
              <Col md={6}>
                <div className="contact-item" style={{ '--index': 3 }}>
                  <a className="contact-icon" href={githubUrl} target="_blank" rel="noopener noreferrer">
                    <i className="bi bi-github"></i>
                  </a>
                  <div className="contact-info">
                    <h5>{t('contact.githubTitle')}</h5>
                    <p>
                      <a href={githubUrl} target="_blank" rel="noopener noreferrer">{githubHandle}</a>
                    </p>
                  </div>
                </div>
              </Col>
            </Row>
          </Col>
        </Row>
      </Container>
    </section>
  );
}

export default Contact;