import React from 'react';
import { Container, Nav, Row, Col, Dropdown, DropdownButton } from 'react-bootstrap';
import './SearchHome.css';
import { FormGroup, FormControlLabel, Checkbox } from '@mui/material';

export default function SearchHome() {
    return (
        <Container className="search-container">
            <Container className="search-controls">
                <Row>
                    <Col>
                        <FormGroup>
                            <FormControlLabel control={<Checkbox defaultChecked />} label="In-Person" />
                            <FormControlLabel control={<Checkbox defaultChecked />} label="Virtual" />
                        </FormGroup>
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
        </Container>
    )
};