import React from 'react';
import { Container } from 'react-bootstrap';
import './MeetingFinderHome.css';
import SearchControls from './SearchControls';

export default function MeetingFinderHome() {
    return (
        <Container className="search-container">
            <SearchControls />
        </Container>
    )
};