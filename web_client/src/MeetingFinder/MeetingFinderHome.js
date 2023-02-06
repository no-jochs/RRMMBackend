import React, { useReducer, useCallback } from "react";
import { Outlet } from "react-router-dom";
import { Container } from "react-bootstrap";
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

  return (
    <Container className="search-container">
      <SearchControls
        filterState={filterState}
        filterDispatch={filterDispatch}
      />
      <Outlet />
    </Container>
  );
}
