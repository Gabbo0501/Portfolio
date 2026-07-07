import Footer from './components/Footer';
import Title from './components/Title';
import About from './components/About';
import Courses from './components/Courses';
import Projects from './components/Projects';
import Skills from './components/Skills';
import Contact from './components/Contact';
import { LanguageProvider } from './contexts/LanguageContext';
import { PortfolioDataProvider } from './contexts/PortfolioDataContext';
import { useTranslation } from './hooks/useTranslation';
import { useEffect } from 'react';
import './App.css';

// Component for updating SEO tags dynamically based on language
function SEOUpdater() {
  const { t } = useTranslation();

  useEffect(() => {
    document.title =
      t('seo.title') || 'Gabriele Mondino - Software Engineer & System Administrator';

    const descMeta = document.querySelector('meta[name="description"]');
    if (descMeta) {
      descMeta.setAttribute('content', t('seo.description'));
    }

    const ogTitle = document.querySelector('meta[property="og:title"]');
    if (ogTitle) {
      ogTitle.setAttribute('content', t('seo.title'));
    }

    const ogDesc = document.querySelector('meta[property="og:description"]');
    if (ogDesc) {
      ogDesc.setAttribute('content', t('seo.description'));
    }
  }, [t]);

  return null;
}

function App() {
  return (
    <LanguageProvider>
      <PortfolioDataProvider>
        <SEOUpdater />
        <div className="App">
          <main className="main-content">
            <Title />
            <About />
            <Courses />
            <Projects />
            <Skills />
            <Contact />
          </main>
          <Footer />
        </div>
      </PortfolioDataProvider>
    </LanguageProvider>
  );
}

export default App;
