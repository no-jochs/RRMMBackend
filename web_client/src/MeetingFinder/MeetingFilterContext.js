import React from "react";

const days = [
  { idx: 0, name: "Sunday", selectedDefault: true },
  { idx: 1, name: "Monday", selectedDefault: true },
  { idx: 2, name: "Tuesday", selectedDefault: true },
  { idx: 3, name: "Wednesday", selectedDefault: true },
  { idx: 4, name: "Thursday", selectedDefault: true },
  { idx: 5, name: "Friday", selectedDefault: true },
  { idx: 6, name: "Saturday", selectedDefault: true },
];

const venues = [
  {
    checked: true,
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
    checked: true,
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
    checked: true,
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
  { idx: 0, name: "English", selectedDefault: true },
  { name: "Spanish", selectedDefault: true, idx: 1 },
  { name: "French", selectedDefault: true, idx: 2 },
  { name: "Russian", selectedDefault: true, idx: 3 },
  { name: "Japanese", selectedDefault: true, idx: 4 },
  { name: "Chinese", selectedDefault: true, idx: 5 },
];

const affinities = [
  {
    idx: 0,
    name: "Beginner Friendly",
    selectedDefault: true,
  },
  {
    idx: 1,
    name: "Food",
    selectedDefault: true,
  },
  {
    idx: 2,
    name: "Sex/Love",
    selectedDefault: true,
  },
  {
    idx: 3,
    name: "Gambling",
    selectedDefault: true,
  },
  {
    idx: 4,
    name: "Friends & Family",
    selectedDefault: true,
  },
  {
    idx: 5,
    name: "Codependency",
    selectedDefault: true,
  },
];

const MeetingFilterContext = React.createContext({
  venues: venues.map((v) => Object.assign({ show: true }, v)),
  searchCoordinates: { latitude: null, longitude: null },
  days: days.map((d) => Object.assign({ show: true }, d)),
  timeLow: 0,
  timeHigh: 23 * 60 + 59,
  languages: languages.map((l) => Object.assign({ show: true }, l)),
  affinities: affinities.map((a) => Object.assign({ show: true }, a)),
});
