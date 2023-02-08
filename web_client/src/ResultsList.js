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
import Meeting from "lib/meeting";
import "./ResultsList.css";

const columns = [
  {
    width: 100,
    label: "Type",
    dataKey: "type",
  },
  {
    width: 60,
    label: "Day",
    dataKey: "day",
  },
  {
    width: 60,
    label: "Time",
    dataKey: "time",
    numeric: true,
  },
  {
    width: 100,
    label: "Name",
    dataKey: "name",
  },
  {
    width: 100,
    label: "Location",
    dataKey: "location",
  },
  {
    width: 120,
    label: "Region",
    dataKey: "region",
  },
  {
    width: 180,
    label: "Affinity",
    dataKey: "affinities",
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
          align={column.numeric || false ? "right" : "left"}
          style={{
            width: column.width,
            backgroundColor: "black",
            color: "white",
          }}
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
    <>
      {columns.map((column) => (
        <TableCell
          key={column.dataKey}
          align={column.numeric || false ? "right" : "left"}
        >
          {row[column.dataKey]}
        </TableCell>
      ))}
    </>
  );
}

export default function ResultsList({ meetings }) {
  const parseData = (meetings) => {
    return meetings.map((m, idx) => {
      let mc = new Meeting(m);
      return {
        id: mc.id(),
        venue: mc.venue(),
        day: mc.dayName(),
        time: mc.nextDate().toString(),
        name: mc.name(),
        location: mc.location().name,
        region: mc.region(),
        affinities: mc.affinities().toString(),
      };
    });
  };
  return (
    <Container className="results-list-container">
      <Paper style={{ height: "100%", width: "100%" }}>
        <TableVirtuoso
          data={parseData(meetings)}
          components={VirtuosoTableComponents}
          fixedHeaderContent={fixedHeaderContent}
          itemContent={rowContent}
          className="results-list-table"
        />
      </Paper>
    </Container>
  );
}
