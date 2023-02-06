import React, { useState } from "react";
import CheckboxButtonGroup from "common/CheckboxButtonGroup";
import { Dropdown, DropdownButton, Container, Row, Col } from "react-bootstrap";
import GroupIcon from "@mui/icons-material/Group";
import DevicesIcon from "@mui/icons-material/Devices";
import CoPresentIcon from "@mui/icons-material/CoPresent";
import ButtonSelectGroup from "common/ButtonSelectGroup";
import MultipleSelectWithChips from "common/MultipleSelectWithChips";
import MultipleSelectDropdown from "common/MultipleSelectDropdown";

export default function SearchControls({ filterState, filterDispatch }) {
  return (
    <Container className="search-controls">
      <Row className="align-items-center">
        <Col xs={2}>
          <MultipleSelectWithChips
            labelName="Venue"
            elements={filterState.venues}
          />
        </Col>
        <Col xs={2}>
          <MultipleSelectDropdown
            entityName="days"
            elements={filterState.days}
            filterDispatch={filterDispatch}
          />
        </Col>
      </Row>
    </Container>
  );
}
