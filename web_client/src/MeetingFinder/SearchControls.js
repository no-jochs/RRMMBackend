import React, { useState } from "react";
import CheckboxButtonGroup from "common/CheckboxButtonGroup";
import { Dropdown, DropdownButton, Container, Row, Col } from "react-bootstrap";
import GroupIcon from "@mui/icons-material/Group";
import DevicesIcon from "@mui/icons-material/Devices";
import CoPresentIcon from "@mui/icons-material/CoPresent";
import ButtonSelectGroup from "common/ButtonSelectGroup";

export default function SearchControls({ filterState, filterDispatch }) {
  return (
    <Container className="search-controls">
      <Row className="align-items-center">
        <Col>
          <ButtonSelectGroup
            entityName="venues"
            elements={filterState.venues}
            filterDispatch={filterDispatch}
          />
        </Col>
        <Col>
          <DropdownButton>
            <Dropdown.Item>Sunday</Dropdown.Item>
            <Dropdown.Item>Monday</Dropdown.Item>
            <Dropdown.Item>Tuesday</Dropdown.Item>
            <Dropdown.Item>Wednesday</Dropdown.Item>
            <Dropdown.Item>Thursday</Dropdown.Item>
            <Dropdown.Item>Friday</Dropdown.Item>
            <Dropdown.Item>Saturday</Dropdown.Item>
          </DropdownButton>
        </Col>
      </Row>
    </Container>
  );
}
