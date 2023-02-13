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
import Meeting from 'lib/meeting';

function App() {
  const [meetings, setMeetings] = useState([]);
  const [hasFetched, setHasFetched] = useState(false);

  useEffect(() => {
    if (hasFetched) {
      return;
    }
    setHasFetched(true);
    fetch("/api/web_client/meetings")
      .then((res) => res.json())
      .then((data) => {
        const meetings = data.map((m) => {
          return new Meeting(m);
        }).sort((a, b) => { return a.time() < b.time() ? -1 : 1; });
        setMeetings(meetings);
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
