import React from 'react';
import { Container, Nav, Row, Col } from 'react-bootstrap';
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
                </Row>
            </Container>
        </Container>
    )
};