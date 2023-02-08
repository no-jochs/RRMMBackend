import React, { useReducer, useEffect, useState } from "react";
import { Outlet } from "react-router-dom";
import { Container, Col, Row } from "react-bootstrap";
import "./MeetingFinderHome.css";
import SearchControls from "./SearchControls";
import {
  MeetingFilterSettings,
  MeetingFilterSettingsReducer,
} from "./MeetingFilterSettings";

export default function MeetingFinderHome() {
  const [filterState, filterDispatch] = useReducer(
    MeetingFilterSettingsReducer,
    MeetingFilterSettings
  );

  const [height, setHeight] = useState(0);
  const [meetings, setMeetings] = useState([]);
  const [locations, setLocations] = useState([]);
  const [hasFetched, setHasFetched] = useState(false);

  useEffect(() => {
    const dcsData = document
      .getElementsByClassName("app-dynamic-content-start")[0]
      .getBoundingClientRect();
    const dceData = document
      .getElementsByClassName("app-dynamic-content-end")[0]
      .getBoundingClientRect();
    setHeight(window.innerHeight - dceData.height - dcsData.height);
  }, []);

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
    <Container
      className="search-container"
      style={{ height, overflowY: "hidden" }}
    >
      <SearchControls
        filterState={filterState}
        filterDispatch={filterDispatch}
      />
      <Outlet meetings={meetings} />
    </Container>
  );
}
