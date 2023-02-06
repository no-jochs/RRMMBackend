import * as React from "react";
import { useTheme } from "@mui/material/styles";
import Box from "@mui/material/Box";
import OutlinedInput from "@mui/material/OutlinedInput";
import InputLabel from "@mui/material/InputLabel";
import MenuItem from "@mui/material/MenuItem";
import FormControl from "@mui/material/FormControl";
import Select from "@mui/material/Select";
import Chip from "@mui/material/Chip";

const ITEM_HEIGHT = 48;
const ITEM_PADDING_TOP = 8;

function getStyles(name, selected, theme) {
  return {
    fontWeight:
      selected.indexOf(name) === -1
        ? theme.typography.fontWeightRegular
        : theme.typography.fontWeightMedium,
  };
}

export default function MultipleSelectWithChips({ labelName, elements }) {
  const theme = useTheme();
  const [selected, setSelected] = React.useState([]);
  const getSelectedElements = (selected) => {
    return selected.map((idx) => elements.find((el) => el.idx == idx));
  };

  const handleChange = (event) => {
    const {
      target: { value },
    } = event;
    setSelected(value);
  };

  return (
    <div>
      <FormControl sx={{ m: 1, width: 180 }} size="small">
        <InputLabel id="demo-multiple-chip-label">{labelName}</InputLabel>
        <Select
          labelId="demo-multiple-chip-label"
          id="demo-multiple-chip"
          multiple
          value={selected}
          onChange={handleChange}
          input={<OutlinedInput id="select-multiple-chip" label="Chip" />}
          renderValue={(selected) => (
            <Box sx={{ display: "flex", flexWrap: "wrap", gap: 0.5 }}>
              {getSelectedElements(selected).map((el) => (
                <Chip key={el.idx} label={el.icon} />
              ))}
            </Box>
          )}
        >
          {elements.map(({ icon, idx, name, show }, i) => (
            <MenuItem
              key={idx}
              value={idx}
              style={getStyles(name, selected, theme)}
            >
              {icon} {name}
            </MenuItem>
          ))}
        </Select>
      </FormControl>
    </div>
  );
}
