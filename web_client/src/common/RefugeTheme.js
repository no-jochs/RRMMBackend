import { createTheme } from "@mui/material/styles";

export const RefugeTheme = createTheme({
  palette: {
    mode: "light",
    primary: {
      main: "#000000",
      contrastText: "#ffffff",
    },
    secondary: {
      main: "#ffffff",
      contrastText: "#000000",
    },
    refuge: {
      main: "#a58529",
      contrastText: "#000000",
    },
    text: {
      secondary: "#ffffff",
    },
    background: {
      paper: "#b2b2b2",
    },
  },
  typography: {
    h1: {
      fontSize: "3.9rem",
      fontFamily: "Oswald",
      fontWeight: 600,
      lineHeight: 1.16,
      letterSpacing: "0em",
    },
    h2: {
      fontFamily: "Open Sans",
      fontSize: "2.6rem",
      fontWeight: 600,
      lineHeight: 1.16,
      letterSpacing: "0em",
    },
    h3: {
      fontSize: "1.5rem",
      fontFamily: "Roboto Condensed",
      lineHeight: 1.16,
      fontWeight: 600,
    },
    body1: {
      fontWeight: 200,
      fontFamily: "Roboto Condensed",
      lineHeight: 1.42,
      letterSpacing: "0em",
    },
    button: {
      fontFamily: "Roboto Condensed",
      fontSize: "0.6rem",
      fontWeight: 400,
      lineHeight: 1.2,
    },
    overline: {
      fontSize: "0.7rem",
      lineHeight: 1.65,
      letterSpacing: "0.04em",
    },
    fontFamily: "Open Sans",
    fontWeightLight: 300,
    fontWeightRegular: 400,
    fontWeightMedium: 500,
    fontWeightBold: 700,
    h4: {
      fontSize: "1.4rem",
      lineHeight: 1.2,
    },
  },
  props: {
    MuiButton: {
      size: "small",
    },
    MuiButtonGroup: {
      size: "small",
    },
    MuiCheckbox: {
      size: "small",
    },
    MuiFab: {
      size: "small",
    },
    MuiFormControl: {
      margin: "dense",
      size: "small",
    },
    MuiFormHelperText: {
      margin: "dense",
    },
    MuiIconButton: {
      size: "small",
    },
    MuiInputBase: {
      margin: "dense",
    },
    MuiInputLabel: {
      margin: "dense",
    },
    MuiRadio: {
      size: "small",
    },
    MuiSwitch: {
      size: "small",
    },
    MuiTextField: {
      margin: "dense",
      size: "small",
    },
  },
  shape: {
    borderRadius: 4,
  },
});
