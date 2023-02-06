import React, { useState } from "react";
import { ToggleButtonGroup, ToggleButton, Button } from "react-bootstrap";
import "./CheckboxButtonGroup.css";

export default function CheckboxButtonGroup({
  entity,
  elements,
  filterDispatch,
}) {
  function handleChange(selected) {
    console.dir(selected);
    if (selected.length == 0) {
      return;
    }
    const toggleIdx =
      elements.filter((e) => e.show).map((e) => e.idx) | selected;
    filterDispatch({ entity, idx: toggleIdx });
  }

  return (
    <ToggleButtonGroup
      type="checkbox"
      size="sm"
      className="cbg"
      onChange={(selected) => handleChange(selected)}
    >
      {elements.map((btn, idx) => (
        <ToggleButton
          id={`tbg-${entity}-${idx}`}
          name={`tbg-${entity}-${idx}`}
          key={idx}
          value={btn.idx}
        >
          <span className="toggle-button-text">
            {btn.icon} {btn.name}
          </span>
        </ToggleButton>
      ))}
    </ToggleButtonGroup>
  );
}
