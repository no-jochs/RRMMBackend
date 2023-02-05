import React, { useState } from "react";
import CheckboxButtonGroup from "common/CheckboxButtonGroup";
import { Dropdown, DropdownButton, Container, Row, Col } from "react-bootstrap";
import GroupIcon from "@mui/icons-material/Group";
import DevicesIcon from "@mui/icons-material/Devices";
import CoPresentIcon from "@mui/icons-material/CoPresent";
import { grey } from "@mui/material/colors";

export default function SearchControls() {
  const [checkboxState, setCheckboxState] = useState([
    {
      label: "In-Person",
      checked: true,
      icon: (
        <GroupIcon
          className="cbg-btn-label-icon"
          sx={{ color: grey, fontSize: "small" }}
        />
      ),
    },
    {
      label: "Online",
      checked: true,
      icon: (
        <DevicesIcon
          className="cbg-btn-label-icon"
          sx={{ color: grey, fontSize: "small" }}
        />
      ),
    },
    {
      label: "Hybrid",
      checked: true,
      icon: (
        <CoPresentIcon
          className="cbg-btn-label-icon"
          sx={{ color: grey, fontSize: "small" }}
        />
      ),
    },
  ]);

  const toggleChecked = (v) => {
    let newCheckboxState = [];

    for (let i = 0; i < checkboxState.length; i++) {
      if (checkboxState[i].label === v) {
        newCheckboxState.push(
          Object.assign(
            { checked: !checkboxState[i].checked },
            checkboxState[i]
          )
        );
      } else {
        newCheckboxState.push(checkboxState[i]);
      }
    }

    setCheckboxState(newCheckboxState);
  };

  return (
    <Container className="search-controls">
      <Row className="align-items-center">
        <Col>
          <CheckboxButtonGroup
            checkboxDetails={checkboxState}
            toggleChecked={toggleChecked}
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
