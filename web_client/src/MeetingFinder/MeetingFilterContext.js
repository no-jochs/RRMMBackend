import React from "react";
import GroupIcon from "@mui/icons-material/Group";
import DevicesIcon from "@mui/icons-material/Devices";
import CoPresentIcon from "@mui/icons-material/CoPresent";
import PersonAddIcon from "@mui/icons-material/PersonAdd";
import DiningIcon from "@mui/icons-material/Dining";
import FavoriteIcon from '@mui/icons-material/Favorite';
import CasinoIcon from '@mui/icons-material/Casino';
import FamilyRestroomIcon from '@mui/icons-material/FamilyRestroom';
import HandshakeIcon from '@mui/icons-material/Handshake';

const days = [
  { idx: 0, name: "Sunday", show: true },
  { idx: 1, name: "Monday", show: true },
  { idx: 2, name: "Tuesday", show: true },
  { idx: 3, name: "Wednesday", show: true },
  { idx: 4, name: "Thursday", show: true },
  { idx: 5, name: "Friday", show: true },
  { idx: 6, name: "Saturday", show: true },
];

const venues = [
  {
    show: true,
    icon: (
      <GroupIcon
        className="cbg-btn-label-icon"
        sx={{ color: grey, fontSize: "small" }}
      />
    ),
    idx: 0,
    label: "In-Person",
  },
  {
    show: true,
    icon: (
      <DevicesIcon
        className="cbg-btn-label-icon"
        sx={{ color: grey, fontSize: "small" }}
      />
    ),
    idx: 1,
    label: "Online",
  },
  {
    show: true,
    icon: (
      <CoPresentIcon
        className="cbg-btn-label-icon"
        sx={{ color: grey, fontSize: "small" }}
      />
    ),
    idx: 2,
    label: "Hybrid",
  },
];

const languages = [
  {
    idx: 0,
    name: "English",
    show: true,
  },
  {
    idx: 1,
    name: "Spanish",
    show: true,
  },
  {
    idx: 2,
    name: "French",
    show: true,
  },
  {
    idx: 3,
    name: "Russian",
    show: true,
  },
  {
    idx: 4,
    name: "Japanese",
    show: true,
  },
  {
    idx: 5,
    name: "Chinese",
    show: true,
  },
];

const affinities = [
  {
    icon: <PersonAddIcon />,
    idx: 0,
    name: "Beginner Friendly",
    show: true,
  },
  {
    icon: <DiningIcon />,
    idx: 1,
    name: "Food",
    show: true,
  },
  {
    icon: (<FavoriteIcon />)
    idx: 2,
    name: "Sex/Love",
    show: true,
  },
  {
    icon: (<CasinoIcon />),
    idx: 3,
    name: "Gambling",
    show: true,
  },
  {
    icon: (<FamilyRestroomIcon />),
    idx: 4,
    name: "Friends & Family",
    show: true,
  },
  {
    icon: (<HandshakeIcon />),
    idx: 5,
    name: "Codependency",
    show: true,
  },
];

const MeetingFilterSettings = React.createContext({
  venues: Object.assign({}, venues),
  searchCoordinates: { latitude: null, longitude: null },
  days: Object.assign({}, days),
  timeLow: 0,
  timeHigh: 23 * 60 + 59,
  languages: Object.assign({}, languages),
  affinities: Object.assign({}, affinities),
});

exports = {
  MeetingFilterSettings,
  venues,
  days,
  languages,
  affinities,
};
