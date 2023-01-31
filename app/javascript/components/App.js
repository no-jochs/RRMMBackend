import React from "react";
import ReactDom from "react-dom";
import AppNavbar from "./AppNavbar";
import { Container } from "react-bootstrap";

export default function App() {
    return (
        <Container className="App" fluid>
            <AppNavbar />
        </Container>
    );
}