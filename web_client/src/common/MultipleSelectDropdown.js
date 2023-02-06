import React from "react";
import { useTheme } from "@mui/material/styles";
import {
  OutlinedInput,
  InputLabel,
  MenuItem,
  FormControl,
  Select,
} from "@mui/material";

export default function MultipleSelectDropdown({
  entityName,
  elements,
  filterDispatch,
}) {
  const [selectValue, setSelectValue] = React.useState(() =>
    elements.filter((e) => e.show)
  );
  const handleChange = (event) => {
    const {
      target: { value },
    } = event;
  };
  const theme = useTheme();
  return (
    <>
      <FormControl sx={{ m: 1, minWidth: 200 }} size="small">
        <InputLabel id="demo-multiple-select-label">Day</InputLabel>
        <Select
          labelId="demo-multiple-select-label"
          id="demo-multiple-select"
          multiple
          value={selectValue}
          onChange={handleChange}
          input={<OutlinedInput label="Day" />}
        >
          {elements.map((el) => (
            <MenuItem key={el.idx} value={el.idx}>
              {el.name}
            </MenuItem>
          ))}
        </Select>
      </FormControl>
    </>
  );
}
