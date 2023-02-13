import * as React from "react";
import { Link } from "react-router-dom";
import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableContainer from "@mui/material/TableContainer";
import TableHead from "@mui/material/TableHead";
import TableRow from "@mui/material/TableRow";
import Paper from "@mui/material/Paper";
import { TableVirtuoso } from "react-virtuoso";
import { Container } from "react-bootstrap";
import "./ResultsList.css";

const columns = [
  {
    width: 100,
    label: "Format",
    dataKey: "format",
    align: "center"
  },
  {
    width: 100,
    label: "Day",
    dataKey: "day",
    align: "center",
    numeric: true,
  },
  {
    width: 100,
    label: "Time",
    dataKey: "time",
    align: "center",
    numeric: true,
  },
  {
    width: 160,
    label: "Meeting",
    dataKey: "meeting",
    align: "left"
  },
  {
    width: 200,
    label: "Venue",
    dataKey: "venue",
    align: "left"
  },
  {
    width: 200,
    label: "Address",
    dataKey: "address",
    align: "left"
  },
  {
    width: 180,
    label: "Affinity",
    dataKey: "affinities",
    align: "left"
  },
];

const VirtuosoTableComponents = {
  Scroller: React.forwardRef((props, ref) => (
    <TableContainer component={Paper} {...props} ref={ref} />
  )),
  Table: (props) => <Table {...props} style={{ borderCollapse: "separate" }} />,
  TableHead,
  TableRow: ({ item: _item, ...props }) => <TableRow {...props} />,
  TableBody: React.forwardRef((props, ref) => (
    <TableBody {...props} ref={ref} />
  )),
};

function fixedHeaderContent() {
  return (
    <TableRow>
      {columns.map((column) => (
        <TableCell
          key={column.dataKey}
          variant="head"
          style={{
            backgroundColor: "black",
            color: "white",
          }}
          sx={{
            backgroundColor: "background.paper",
          }}
          align={column.align}
        >
          {column.label}
        </TableCell>
      ))}
    </TableRow>
  );
}

function rowContent(_index, m) {
  return (
    <>
      <TableCell align="center">
        {m.formatIcon()} {m.format()}
      </TableCell>
      <TableCell align="center">
        {m.formattedNextDayName()}
      </TableCell>
      <TableCell align="center">
        {m.formattedNextTime()}
      </TableCell>
      <TableCell align="left">
        <Link to={`meetings/${m.slug()}`}>{m.name()}</Link>
      </TableCell>
      <TableCell align="left">
        <Link to={`locations/${m.locationSlug()}`}>{m.locationName()}</Link>
      </TableCell>
      <TableCell className="multi-line-format" align="left">{m.formattedAddress()}</TableCell>
      <TableCell align="left">
        {m.affinities().toString()}
      </TableCell>
    </>
  );
}

export default function ResultsList({ meetings }) {
  return (
    <Container className="results-list-container">
      <Paper style={{ height: "100%", width: "100%" }}>
        <TableVirtuoso
          data={meetings}
          components={VirtuosoTableComponents}
          fixedHeaderContent={fixedHeaderContent}
          itemContent={rowContent}
          className="results-list-table"
        />
      </Paper>
    </Container>
  );
}
