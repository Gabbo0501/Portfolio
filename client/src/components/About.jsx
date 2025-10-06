import { useState, useEffect } from 'react';
import { Container, Row, Col, Card, Badge, Spinner } from 'react-bootstrap';
import { portfolioAPI } from '../services/api';
import { useTranslation } from '../hooks/useTranslation';
import { useLanguage } from '../contexts/LanguageContext';
import './About.css';

function About() {
  const [portfolioData, setPortfolioData] = useState(null);
  const [loading, setLoading] = useState(true);
  const { t } = useTranslation();
  const { language } = useLanguage();

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

  if (loading) {
    return (
      <section id="about" className="py-5">
        <Container className="about-loading">
          <div className="loading-spinner"></div>
        </Container>
      </section>
    );
  }

  if (!portfolioData) {
    return (
      <section id="about" className="py-5">
        <Container>
          <div className="alert alert-danger">{t('common.error')}</div>
        </Container>
      </section>
    );
  }

  const { personalInfo, education, certifications } = portfolioData;

  return (
    <section id="about" className="py-5">
      <Container>
        <Row className="mb-4 mt-4">
          <Col>
            <h2 className="about-title text-center">{t('about.title')}</h2>
          </Col>
        </Row>
        
        <Row className="g-4 mb-5">
          <Col>
            <p className="about-bio">
              {personalInfo?.bio || t('about.defaultBio')}
            </p>
          </Col>
        </Row>
        <Row className="mb-5">
          <Col>
            <h3 className="section-header">
              <i className="bi bi-mortarboard"></i>
              {t('about.educationTitle')}
            </h3>
            <Row className="justify-content-center">
              <Col lg={8}>
                {education && education.map((edu, index) => (
                  <Card key={index} className="education-card" style={{ '--index': index }}>
                    <Card.Body className="d-flex align-items-start p-0">
                      <div className="education-icon me-3">
                        {index + 1}
                      </div>
                      <div className="education-content flex-grow-1">
                        <h4 className="education-degree">{edu.degree}</h4>
                        <h5 className="education-institution">{edu.institution}</h5>
                        <Badge className={`education-badge ${edu.end_year ? '' : 'in-progress'}`}>
                          {edu.start_year} - {edu.end_year || t('about.inProgress')}
                          {edu.gpa && ` | ${t('about.grade')}: ${edu.gpa}/100`}
                        </Badge>
                        <p className="education-description">
                          {edu.description}
                        </p>
                      </div>
                    </Card.Body>
                  </Card>
                ))}
              </Col>
            </Row>
          </Col>
        </Row>

        <Row className="mb-5">
          <Col>
            <h3 className="section-header">
              <i className="bi bi-award"></i>
              {t('about.certificationsTitle')}
            </h3>
            <Row className="justify-content-center">
              <Col lg={8}>
                {certifications && certifications.map((cert, index) => (
                  <Card key={index} className="education-card" style={{ '--index': index }}>
                    <Card.Body className="d-flex align-items-start p-0">
                      <div className="education-icon me-3">
                        <i className="bi bi-award"></i>
                      </div>
                      <div className="education-content flex-grow-1">
                        <h4 className="education-degree">{cert.name}</h4>
                        <h5 className="education-institution">{cert.organization}</h5>
                        <Badge className="education-badge">
                          {cert.level && `${cert.level} | `}
                          {cert.date_obtained && new Date(cert.date_obtained).toLocaleDateString(language === 'it' ? 'it-IT' : 'en-US')}
                        </Badge>
                        {cert.description && (
                          <p className="education-description">
                            {cert.description}
                          </p>
                        )}
                        {cert.credential_id && (
                          <p className="education-description">
                            Credential ID: {cert.credential_id}
                          </p>
                        )}
                      </div>
                    </Card.Body>
                  </Card>
                ))}
                {(!certifications || certifications.length === 0) && (
                  <Card className="education-card" style={{ '--index': 0 }}>
                    <Card.Body className="d-flex align-items-start p-0">
                      <div className="education-icon me-3">
                        <i className="bi bi-translate"></i>
                      </div>
                      <div className="education-content flex-grow-1">
                        <h4 className="education-degree">IELTS Academic</h4>
                        <h5 className="education-institution">International English Language Testing System</h5>
                        <Badge className="education-badge">
                          C1 Level | Overall Band Score
                        </Badge>
                        <p className="education-description">
                          {t('about.ieltsDescription')}
                        </p>
                      </div>
                    </Card.Body>
                  </Card>
                )}
              </Col>
            </Row>
          </Col>
        </Row>

        <Row>
          <Col>
            <h3 className="section-header">
              <i className="bi bi-lightbulb"></i>
              {t('about.interestsTitle')}
            </h3>
            <Row className="g-4">
              <Col md={6} lg={4}>
                <Card className="interest-card text-center" style={{ '--index': 0 }}>
                  <Card.Body>
                    <div className="interest-icon">
                      <i className="bi bi-laptop"></i>
                    </div>
                    <h4 className="interest-title">{t('about.webDev.title')}</h4>
                    <p className="interest-description">
                      {t('about.webDev.description')}
                    </p>
                  </Card.Body>
                </Card>
              </Col>
              <Col md={6} lg={4}>
                <Card className="interest-card text-center" style={{ '--index': 1 }}>
                  <Card.Body>
                    <div className="interest-icon">
                      <i className="bi bi-phone"></i>
                    </div>
                    <h4 className="interest-title">{t('about.mobileDev.title')}</h4>
                    <p className="interest-description">
                      {t('about.mobileDev.description')}
                    </p>
                  </Card.Body>
                </Card>
              </Col>
              <Col md={6} lg={4}>
                <Card className="interest-card text-center" style={{ '--index': 2 }}>
                  <Card.Body>
                    <div className="interest-icon">
                      <i className="bi bi-gear-wide-connected"></i>
                    </div>
                    <h4 className="interest-title">{t('about.softwareEng.title')}</h4>
                    <p className="interest-description">
                      {t('about.softwareEng.description')}
                    </p>
                  </Card.Body>
                </Card>
              </Col>
            </Row>
          </Col>
        </Row>
      </Container>
    </section>
  );
}

export default About;