import * as React from "react";
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

const sample = [
  ["Frozen yoghurt", "159", "6.0", "24", "4.0"],
  ["Ice cream sandwich", "237", "9.0", "37", "4.3"],
  ["Eclair", "262", "16.0", "24", "6.0"],
  ["Cupcake", "305", "3.7", "67", "4.3"],
  ["Gingerbread", "356", "16.0", "49", "3.9"],
];

function createData(
  id,
  meetingtime,
  meetingname,
  meetinglocation,
  meetingaddress,
  meetingtype
) {
  return {
    id,
    meetingtime,
    meetingname,
    meetinglocation,
    meetingaddress,
    meetingtype,
  };
}

const columns = [
  {
    width: 60,
    label: "Time",
    dataKey: "meetingtime",
  },
  {
    width: 100,
    label: "Name",
    dataKey: "meetingname",
  },
  {
    width: 100,
    label: "Location",
    dataKey: "meetinglocation",
  },
  {
    width: 180,
    label: "Address",
    dataKey: "meetingaddress",
  },
  {
    width: 100,
    label: "Type",
    dataKey: "meetingtype",
  },
];

const rows = Array.from({ length: 200 }, (_, index) => {
  const randomSelection = sample[Math.floor(Math.random() * sample.length)];
  return createData(index, ...randomSelection);
});

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
          align={column.numeric || false ? "right" : "left"}
          style={{ width: column.width }}
          sx={{
            backgroundColor: "background.paper",
          }}
        >
          {column.label}
        </TableCell>
      ))}
    </TableRow>
  );
}

function rowContent(_index, row) {
  return (
    <React.Fragment>
      {columns.map((column) => (
        <TableCell
          key={column.dataKey}
          align={column.numeric || false ? "right" : "left"}
        >
          {row[column.dataKey]}
        </TableCell>
      ))}
    </React.Fragment>
  );
}

export default function ResultsList() {
  return (
    <Container className="results-list-container">
      <Paper style={{ height: "100%", width: "100%" }}>
        <TableVirtuoso
          data={rows}
          components={VirtuosoTableComponents}
          fixedHeaderContent={fixedHeaderContent}
          itemContent={rowContent}
        />
      </Paper>
    </Container>
  );
}
