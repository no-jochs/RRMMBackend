import React from 'react';
import { ToggleButtonGroup, ToggleButton } from 'react-bootstrap';
import './CheckboxButtonGroup.css';

export default function CheckboxButtonGroup({ checkboxDetails, toggleChecked }) {
    return (
        <ToggleButtonGroup type="checkbox" defaultValue={checkboxDetails.filter((d) => d.checked).map((d) => d.label)} className="cbg">
            {checkboxDetails.map((checkbox, idx) => (
                <ToggleButton
                    key={idx}
                    id={`tcb - ${checkbox.label} `}
                    value={checkbox.label}
                    type="checkbox"
                    variant="outline-dark"
                    name="checkbox"
                    checked={checkbox.checked}
                    onClick={(e) => toggleChecked(e)}>
                    <span className="toggle-button-text">{checkbox.icon}  {checkbox.label}</span>
                </ToggleButton>
            ))}
        </ToggleButtonGroup>
    )
}