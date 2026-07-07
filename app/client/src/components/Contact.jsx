import { Container, Row, Col } from 'react-bootstrap';
import { useTranslation } from '../hooks/useTranslation';
import { useScrollReveal } from '../hooks/useScrollReveal';
import { usePortfolioData } from '../hooks/usePortfolioData';
import './Contact.css';

function Contact() {
  const { t } = useTranslation();
  const { portfolioData } = usePortfolioData();
  const personal = portfolioData?.personalInfo || null;
  const sectionRef = useScrollReveal([personal]);

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
    <section id="contact" className="contact-section" ref={sectionRef}>
      <Container>
        <Row className="mb-5">
          <Col>
            <h2 className="contact-title text-center reveal">{t('contact.title')}</h2>
          </Col>
        </Row>

        <Row className="justify-content-center">
          <Col lg={10} xl={8}>
            <Row className="g-4">
              <Col md={6}>
                <div className="contact-item reveal" style={{ '--index': 0 }}>
                  <a className="contact-icon" href={emailUrl} aria-label={t('contact.emailLabel')}>
                    <i className="bi bi-envelope" aria-hidden="true"></i>
                  </a>
                  <div className="contact-info">
                    <h5>{t('contact.emailTitle')}</h5>
                    <p>
                      <a href={emailUrl}>{email || 'gabrielemondino05@gmail.com'}</a>
                    </p>
                  </div>
                </div>
              </Col>

              <Col md={6}>
                <div className="contact-item reveal" style={{ '--index': 1 }}>
                  <a
                    className="contact-icon"
                    href={linkedinUrl}
                    target="_blank"
                    rel="noopener noreferrer"
                    aria-label={t('contact.linkedinLabel')}
                  >
                    <i className="bi bi-linkedin" aria-hidden="true"></i>
                  </a>
                  <div className="contact-info">
                    <h5>{t('contact.linkedinTitle')}</h5>
                    <p>
                      <a href={linkedinUrl} target="_blank" rel="noopener noreferrer">
                        {name || linkedinUrl.replace(/^https?:\/\/(www\.)?linkedin\.com\//i, '')}
                      </a>
                    </p>
                  </div>
                </div>
              </Col>

              <Col md={6}>
                <div className="contact-item reveal" style={{ '--index': 2 }}>
                  <div className="contact-icon">
                    <i className="bi bi-geo-alt" aria-hidden="true"></i>
                  </div>
                  <div className="contact-info">
                    <h5>{t('contact.locationTitle')}</h5>
                    <p>{location}</p>
                  </div>
                </div>
              </Col>

              <Col md={6}>
                <div className="contact-item reveal" style={{ '--index': 3 }}>
                  <a
                    className="contact-icon"
                    href={githubUrl}
                    target="_blank"
                    rel="noopener noreferrer"
                    aria-label={t('contact.githubLabel')}
                  >
                    <i className="bi bi-github" aria-hidden="true"></i>
                  </a>
                  <div className="contact-info">
                    <h5>{t('contact.githubTitle')}</h5>
                    <p>
                      <a href={githubUrl} target="_blank" rel="noopener noreferrer">
                        {githubHandle}
                      </a>
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
