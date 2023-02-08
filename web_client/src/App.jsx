import React, { useEffect, useState } from 'react';
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
  const [meetings, setMeetings] = useState([]);
  const [locations, setLocations] = useState([]);
  const [hasFetched, setHasFetched] = useState(false);
  useEffect(() => {
    if (hasFetched) {
      return;
    }
    setHasFetched(true);
    fetch("/api/web_client/meetings")
      .then((res) => res.json())
      .then((data) => {
        setMeetings(data);
      });
  });
  return (
    <ThemeProvider theme={RefugeTheme}>
      <Container className="app-container" fluid>
        <AppNavbar />
        <Routes>
          <Route path="/" element={<MeetingFinderHome />}>
            <Route index element={<ResultsList meetings={meetings} />} />
            <Route path="map" element={<ResultsMap meetings={meetings} />} />
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
