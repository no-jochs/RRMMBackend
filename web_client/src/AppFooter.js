import React from "react";
import { Container, Navbar } from "react-bootstrap";
import "./AppFooter.css";

export default function AppFooter() {
  return (
    <Navbar id="app-footer" className="app-dynamic-content-end">
      <Container className="footer-container flex-row-reverse">
        <Navbar.Text className="copywrite-text">
          {"© 2023 Refuge Recovery World Services"}
        </Navbar.Text>
      </Container>
    </Navbar>
  );
}
