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

  useEffect(() => {
    const dcsData = document
      .getElementsByClassName("app-dynamic-content-start")[0]
      .getBoundingClientRect();
    const dceData = document
      .getElementsByClassName("app-dynamic-content-end")[0]
      .getBoundingClientRect();
    setHeight(window.innerHeight - dceData.height - dcsData.height);
  }, []);

  return (
    <Container
      className="search-container"
      style={{ height, overflowY: "hidden" }}
    >
      <SearchControls
        filterState={filterState}
        filterDispatch={filterDispatch}
      />
      <Outlet />
    </Container>
  );
}
