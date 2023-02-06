import React from "react";
import { Button, ButtonGroup } from "@mui/material";
import { styled } from "@mui/material/styles";
import "./ButtonSelectGroup.css";

function ButtonSelectGroupButton({ element, entityName, filterDispatch }) {
  const [selected, setSelected] = React.useState(element.show);

  return (
    <Button
      key={element.idx}
      className={`bsg-btn bsg-btn-${
        element.show ? "selected" : "not-selected"
      }`}
      variant={element.show ? "contained" : "outlined"}
      onClick={(e) => {
        setSelected(!element.show);
        filterDispatch({
          entity: entityName,
          idx: element.idx,
          value: !element.show,
        });
      }}
    >
      <span className="bsg-btn-text">
        {element.icon} {element.name}
      </span>
    </Button>
  );
}

const StyledButtonSelectGroupButton = styled(ButtonSelectGroupButton)(() => ({
  "&.bsg-btn-selected": {
    backgroundColor: "black",
    color: "white",
  },
  "&.bsg-btn-not-selected": {
    backgroundColor: "rgba(0,0,0,0)",
    color: "black",
  },
}));

export default function ButtonSelectGroup({
  elements,
  entityName,
  filterDispatch,
}) {
  console.dir(elements);
  return (
    <ButtonGroup className="bsl" size="small">
      {elements.map((el) => (
        <StyledButtonSelectGroupButton
          key={el.idx}
          element={el}
          entityName={entityName}
          filterDispatch={filterDispatch}
        />
      ))}
    </ButtonGroup>
  );
}
