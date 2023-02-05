import React from "react";
import { Container, Navbar } from "react-bootstrap";
import "./AppNavbar.css";

export default function AppNavbar() {
  return (
    <Navbar expand="xl" className="app-navbar">
      <Container className="navbar-container justify-content-start">
        <Navbar.Brand href="/">
          <img
            className="nav-logo"
            src="../assets/rrlogo-goldonblack.png"
            alt="Refuge Recovery Logo"
          />
        </Navbar.Brand>
        <Navbar.Text className="nav-logo-text">
          Refuge Recovery Meetings
        </Navbar.Text>
      </Container>
    </Navbar>
  );
}
