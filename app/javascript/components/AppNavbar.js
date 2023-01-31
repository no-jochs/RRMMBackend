import React from 'react';
import { Navbar, NavbarBrand } from 'react-bootstrap';

export default function AppNavbar() {
    return (
        <Navbar className="app-navbar">
            <NavbarBrand href="#"><img className="logo" src="blackongold.png" alt="Refuge Recovery Logo" /></NavbarBrand>
        </Navbar>
    );
}