import { Container, Row, Col, Card, Form, Button, Alert } from 'react-bootstrap';
import { useTranslation } from '../hooks/useTranslation';
import './Contact.css';

function Contact() {
  const { t } = useTranslation();

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
                  <div className="contact-icon">
                    <i className="bi bi-envelope"></i>
                  </div>
                  <div className="contact-info">
                    <h5>Email</h5>
                    <p>gabrielemondino05@gmail.com</p>
                  </div>
                </div>
              </Col>
              
              <Col md={6}>
                <div className="contact-item" style={{ '--index': 1 }}>
                  <div className="contact-icon">
                    <i className="bi bi-linkedin"></i>
                  </div>
                  <div className="contact-info">
                    <h5>LinkedIn</h5>
                    <p>linkedin.com/in/tuoprofilo</p>
                  </div>
                </div>
              </Col>
              
              <Col md={6}>
                <div className="contact-item" style={{ '--index': 2 }}>
                  <div className="contact-icon">
                    <i className="bi bi-geo-alt"></i>
                  </div>
                  <div className="contact-info">
                    <h5>Località</h5>
                    <p>Torino, Italia</p>
                  </div>
                </div>
              </Col>
              
              <Col md={6}>
                <div className="contact-item" style={{ '--index': 3 }}>
                  <div className="contact-icon">
                    <i className="bi bi-github"></i>
                  </div>
                  <div className="contact-info">
                    <h5>GitHub</h5>
                    <p>github.com/tuousername</p>
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