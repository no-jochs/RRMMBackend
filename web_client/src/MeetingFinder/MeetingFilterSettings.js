import React from "react";
import GroupIcon from "@mui/icons-material/Group";
import DevicesIcon from "@mui/icons-material/Devices";
import CoPresentIcon from "@mui/icons-material/CoPresent";
import PersonAddIcon from "@mui/icons-material/PersonAdd";
import DiningIcon from "@mui/icons-material/Dining";
import FavoriteIcon from "@mui/icons-material/Favorite";
import CasinoIcon from "@mui/icons-material/Casino";
import FamilyRestroomIcon from "@mui/icons-material/FamilyRestroom";
import HandshakeIcon from "@mui/icons-material/Handshake";
import { grey } from "@mui/material/colors";

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
    icon: (
      <GroupIcon
        className="cbg-btn-label-icon"
        sx={{ color: grey, fontSize: "small" }}
      />
    ),
    idx: 0,
    name: "In-Person",
    show: true,
  },
  {
    icon: (
      <DevicesIcon
        className="cbg-btn-label-icon"
        sx={{ color: grey, fontSize: "small" }}
      />
    ),
    idx: 1,
    name: "Online",
    show: true,
  },
  {
    icon: (
      <CoPresentIcon
        className="cbg-btn-label-icon"
        sx={{ color: grey, fontSize: "small" }}
      />
    ),
    idx: 2,
    name: "Hybrid",
    show: true,
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
    icon: <FavoriteIcon />,
    idx: 2,
    name: "Sex/Love",
    show: true,
  },
  {
    icon: <CasinoIcon />,
    idx: 3,
    name: "Gambling",
    show: true,
  },
  {
    icon: <FamilyRestroomIcon />,
    idx: 4,
    name: "Friends & Family",
    show: true,
  },
  {
    icon: <HandshakeIcon />,
    idx: 5,
    name: "Codependency",
    show: true,
  },
];

export const MeetingFilterSettings = {
  venues: Object.assign([], venues),
  coordinates: { latitude: null, longitude: null },
  days: Object.assign([], days),
  timeLow: 0,
  timeHigh: 23 * 60 + 59,
  languages: Object.assign([], languages),
  affinities: Object.assign([], affinities),
};

export const MeetingFilterSettingsReducer = function (state, action) {
  let newState = Object.assign({}, state);

  switch (action.entity) {
    case "days":
      let day = newState.days.find((d) => d.idx === action.idx);
      if (day) {
        day.show = !day.show;
      } else {
        throw new Error("Invalid day provided to MeetingFilterSettingsReducer");
      }
      return newState;
    case "venues":
      let venue = newState.venues.find((v) => v.idx === action.idx);
      if (venue) {
        venue.show = !venue.show;
      } else {
        throw new Error(
          "Invalid venue provided to MeetingFilterSettingsReducer"
        );
      }
      return newState;
    case "languages":
      let language = newState.languages.find((l) => l.idx === action.idx);
      if (language) {
        language.show = !language.show;
      } else {
        throw new Error(
          "Invalid language provided to MeetingFilterSettingsReducer"
        );
      }
      return newState;
    case "affinities":
      let affinity = newState.affinities.find((a) => a.idx === action.idx);
      if (affinity) {
        affinity.show = !affinity.show;
      } else {
        throw new Error(
          "Invalid affinity provided to MeetingFilterSettingsReducer"
        );
      }
      return newState;
    case "coordinates":
      let coordinates = newState.coordinates;
      if (!coordinates || !action.value) {
        throw new Error(
          "No coordinate values provided to MeetingFilterSettingsReducer"
        );
      }
      let latitude = parseFloat(action.value.latitude);
      let longitude = parseFloat(action.value.longitude);

      if (typeof latitude !== "number" || typeof longitude !== "number") {
        throw new Error(
          "Invalid coordinate values provided to MeetingFilterSettingsReducer."
        );
      }
      newState.coordinates = { latitude, longitude };
      return newState;
    case "timeLow":
      if (!newState.timeLow || !action.value) {
        throw new Error(
          "No timeLow value provided to MeetingFilterSettingsReducer."
        );
      }
      let timeLow = parseInt(action.value);
      if (typeof timeLow !== "number") {
        throw new Error(
          "Invalid timeLow value provided to MeetingFilterSettingsReducer."
        );
      }
      newState.timeLow = timeLow;
      return newState;
    case "timeHigh":
      if (!newState.timeHigh || !action.value) {
        throw new Error(
          "No timeHigh value provided to MeetingFilterSettingsReducer."
        );
      }
      let timeHigh = parseInt(action.value);
      if (typeof timeHigh !== "number") {
        throw new Error(
          "Invalid timeHigh value provided to MeetingFilterSettingsReducer."
        );
      }
      newState.timeHigh = timeHigh;
      return newState;
    default:
      throw new Error(
        "Invalid entity provided to MeetingFilterSettingsReducer"
      );
  }
};
