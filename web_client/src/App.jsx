import logo from './logo.svg';
import { Routes, Route } from 'react-router-dom';
import { Container } from 'react-bootstrap';
import AppNavbar from './AppNavbar';
import SearchHome from './SearchHome';
import ResultsList from './ResultsList';
import ResultsMap from './ResultsMap';
import MeetingDetail from './MeetingDetail';
import DetailLayout from './DetailLayout';
import LocationDetail from './LocationDetail';
import NewMeetingForm from './NewMeetingForm';
import './App.css';

function App() {
  return (
    <Container className="app-container" fluid>
      <AppNavbar />
      <Routes>
        <Route path="/" element={<SearchHome />}>
          <Route index element={<ResultsList />} />
          <Route path="map" element={<ResultsMap />} />
        </Route>
        <Route element={<DetailLayout />}>
          <Route path="/meetings/:meetingId" element={<MeetingDetail />} />
          <Route path="/locations/:locationId" element={<LocationDetail />} />
        </Route>
        <Route path="/start-a-meeting" element={<NewMeetingForm />} />
      </Routes>
    </Container >
  );
}

export default App;
