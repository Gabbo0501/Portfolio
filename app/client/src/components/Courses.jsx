import { useState, useEffect } from 'react';
import { Container, Row, Col, Modal, Table } from 'react-bootstrap';
import { portfolioAPI } from '../services/api';
import { useTranslation } from '../hooks/useTranslation';
import { useLanguage } from '../contexts/LanguageContext';
import './Courses.css';

function Courses() {
  const [portfolioData, setPortfolioData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [showAllExams, setShowAllExams] = useState(false);
  const { t } = useTranslation();
  const { language } = useLanguage();

  useEffect(() => {
    const fetchData = async () => {
      try {
        const data = await portfolioAPI.getPortfolioData(language);
        setPortfolioData(data);
      } catch (error) {
        console.error('Error loading courses:', error);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [language]); // Re-fetch when language changes

  const handleCloseModal = () => setShowAllExams(false);
  const handleShowModal = () => setShowAllExams(true);

  if (loading) {
    return (
      <section id="courses" className="courses-section">
        <Container className="courses-loading">
          <div className="loading-spinner"></div>
          <div className="loading-text">{t('common.loading')}</div>
        </Container>
      </section>
    );
  }

  if (!portfolioData) {
    return (
      <section id="courses" className="courses-section">
        <Container>
          <div className="alert alert-danger">{t('common.error')}</div>
        </Container>
      </section>
    );
  }

  return (
    <section id="courses" className="courses-section">
      <Container>
        <Row className="mb-5">
          <Col>
            <h2 className="courses-title">
              {t('courses.title')}
            </h2>
            <p className="courses-intro">
              {t('courses.description')}
            </p>
          </Col>
        </Row>

        {/* Featured Courses */}
        <div className="featured-courses">
          {portfolioData.featuredCourses?.map((course, index) => (
            <div key={index} className="course-card" style={{ '--index': index }}>
              <div className="course-header">
                <h3 className="course-title">{course.name}</h3>
              </div>
              
              <div className="course-badges">
                <span className="course-badge">{course.code}</span>
                <span className="course-badge">{course.credits} CFU</span>
                <span className="course-badge grade">{course.grade}/30</span>
              </div>
              
              <p className="course-description">{course.description}</p>
              
              <div className="course-topics-section">
                <h6>{t('courses.topics')}</h6>
                <div className="course-topics">
                  {course.topics.map((topic, topicIndex) => (
                    <span key={topicIndex} className="topic-badge">
                      {topic}
                    </span>
                  ))}
                </div>
              </div>

              <div className="course-footer">
                <div className="course-meta">{course.semester} - {course.year}</div>
                <a 
                  href={course.url}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="course-link"
                >
                  <i className="bi bi-box-arrow-up-right"></i>
                  {t('courses.details')}
                </a>
              </div>
            </div>
          ))}
        </div>

        {/* Button to show all exams */}
        <div className="show-all-section">
          <button 
            onClick={handleShowModal}
            className="show-all-btn"
          >
            <i className="bi bi-list-ul"></i>
            {t('courses.showAll')}
          </button>
        </div>

        {/* Modal with all exams */}
        <Modal show={showAllExams} onHide={handleCloseModal} size="xl" scrollable>
          <Modal.Header className="modal-header">
            <Modal.Title className="modal-title">
              <i className="bi bi-mortarboard"></i>
              <span>{t('courses.allExams')}</span>
            </Modal.Title>
          </Modal.Header>
          <Modal.Body className="modal-body">
            {/* Magistrale Exams */}
            <div className="degree-section">
              <div className="degree-header">
                <div className="degree-icon">
                  <i className="bi bi-graduation-cap fs-4"></i>
                </div>
                <div className="degree-info">
                  <h4>{t('courses.magistrale')}</h4>
                  <p>{t('courses.magistraleDesc')}</p>
                </div>
              </div>
              
              <div className="exam-table-container">
                <Table hover className="exam-table">
                  <thead>
                    <tr>
                      <th>
                        <i className="bi bi-bookmark me-2"></i>{t('courses.exam')}
                      </th>
                      <th className="text-center">
                        <i className="bi bi-award me-2"></i>{t('courses.credits')}
                      </th>
                      <th className="text-center">
                        <i className="bi bi-star me-2"></i>{t('courses.grade')}
                      </th>
                      <th className="text-center">
                        <i className="bi bi-calendar me-2"></i>{t('courses.date')}
                      </th>
                      <th className="text-center">
                        <i className="bi bi-link-45deg me-2"></i>{t('courses.info')}
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    {portfolioData.exams?.magistrale?.map((exam, index) => (
                      <tr key={index} className="exam-row">
                        <td>
                          <div>
                            <div className="exam-name">{exam.name}</div>
                            <div className="exam-code">
                              <i className="bi bi-hash"></i>
                              {exam.code}
                            </div>
                          </div>
                        </td>
                        <td className="text-center">
                          <span className="exam-badge credits">
                            {exam.credits}
                          </span>
                        </td>
                        <td className="text-center">
                          <span className="exam-badge grade">
                            {exam.grade}
                          </span>
                        </td>
                        <td className="text-center exam-date">
                          {new Date(exam.date.split('/').reverse().join('-')).toLocaleDateString(language === 'it' ? 'it-IT' : 'en-US', {
                            day: '2-digit',
                            month: 'short',
                            year: 'numeric'
                          })}
                        </td>
                        <td className="text-center">
                          <a 
                            href={exam.url}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="exam-link"
                          >
                            <i className="bi bi-box-arrow-up-right"></i>
                            Dettagli
                          </a>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </Table>
              </div>
            </div>

            {/* Triennale Exams */}
            <div className="degree-section">
              <div className="degree-header">
                <div className="degree-icon"/>
                <div className="degree-info">
                  <h4>{t('courses.triennale')}</h4>
                  <p>{t('courses.triennaleDesc')}</p>
                </div>
              </div>
              
              <div className="exam-table-container">
                <Table hover className="exam-table">
                  <thead>
                    <tr>
                      <th>
                        <i className="bi bi-bookmark me-2"></i>{t('courses.exam')}
                      </th>
                      <th className="text-center">
                        <i className="bi bi-award me-2"></i>{t('courses.credits')}
                      </th>
                      <th className="text-center">
                        <i className="bi bi-star me-2"></i>{t('courses.grade')}
                      </th>
                      <th className="text-center">
                        <i className="bi bi-calendar me-2"></i>{t('courses.date')}
                      </th>
                      <th className="text-center">
                        <i className="bi bi-link-45deg me-2"></i>{t('courses.info')}
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    {portfolioData.exams?.triennale?.map((exam, index) => (
                      <tr key={index} className="exam-row">
                        <td>
                          <div>
                            <div className="exam-name">{exam.name}</div>
                            <div className="exam-code">
                              <i className="bi bi-hash"></i>
                              {exam.code}
                            </div>
                          </div>
                        </td>
                        <td className="text-center">
                          <span className="exam-badge credits">
                            {exam.credits}
                          </span>
                        </td>
                        <td className="text-center">
                          <span className="exam-badge grade">
                            {exam.grade}
                          </span>
                        </td>
                        <td className="text-center exam-date">
                          {new Date(exam.date.split('/').reverse().join('-')).toLocaleDateString(language === 'it' ? 'it-IT' : 'en-US', {
                            day: '2-digit',
                            month: 'short',
                            year: 'numeric'
                          })}
                        </td>
                        <td className="text-center">
                          <a 
                            href={exam.url}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="exam-link"
                          >
                            <i className="bi bi-box-arrow-up-right"></i>
                            Dettagli
                          </a>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </Table>
              </div>
            </div>
          </Modal.Body>
          <Modal.Footer className="modal-footer">
            <div className="d-flex justify-content-between w-100 align-items-center">
              <div className="modal-note">
                <i className="bi bi-info-circle"></i>
                {t('courses.modalNote')}
              </div>
              <button onClick={handleCloseModal} className="modal-close-btn">
                <i className="bi bi-x-lg me-2"></i>
                {t('courses.close')}
              </button>
            </div>
          </Modal.Footer>
        </Modal>
      </Container>
    </section>
  );
}

export default Courses;