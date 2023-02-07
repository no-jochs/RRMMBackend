import { Routes, Route } from 'react-router-dom';
import { Container } from 'react-bootstrap';
import AppNavbar from './AppNavbar';
import MeetingFinderHome from 'MeetingFinder/MeetingFinderHome';
import ResultsList from './ResultsList';
import ResultsMap from './ResultsMap';
import MeetingDetail from './MeetingDetail';
import DetailLayout from './DetailLayout';
import LocationDetail from './LocationDetail';
import NewMeetingForm from './NewMeetingForm';
import { ThemeProvider } from '@mui/material/styles';
import { RefugeTheme } from 'common/RefugeTheme';
import './App.css';
import AppFooter from 'AppFooter';

function App() {
  return (
    <ThemeProvider theme={RefugeTheme}>
      <Container className="app-container" fluid>
        <AppNavbar />
        <Routes>
          <Route path="/" element={<MeetingFinderHome />}>
            <Route index element={<ResultsList />} />
            <Route path="map" element={<ResultsMap />} />
          </Route>
          <Route element={<DetailLayout />}>
            <Route path="/meetings/:meetingId" element={<MeetingDetail />} />
            <Route path="/locations/:locationId" element={<LocationDetail />} />
          </Route>
          <Route path="/start-a-meeting" element={<NewMeetingForm />} />
        </Routes>
        <AppFooter />
      </Container >
    </ThemeProvider>
  );
}

export default App;
