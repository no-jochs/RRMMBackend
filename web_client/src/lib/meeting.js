import React from 'react';
import GroupIcon from "@mui/icons-material/Group";
import DevicesIcon from "@mui/icons-material/Devices";
import CoPresentIcon from "@mui/icons-material/CoPresent";
import { grey } from "@mui/material/colors";

export default class Meeting {
  static dayNames = Object.freeze([
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ]);
  static dayNamesShort = Object.freeze([
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
  ]);
  constructor(data) {
    this.data = data;
  }
  localeOptions() {
    const navigatorLang = window && window.navigator && window.navigator.language || null;
    return navigatorLang ? [navigatorLang, 'en'] : 'en';
  }
  tfOpts() {
    return new Intl.DateTimeFormat(this.localeOptions(), { hour: "numeric", minute: "numeric" });
  }
  dfOpts() {
    return new Intl.DateTimeFormat(this.localeOptions(), { weekday: "long" });
  }
  id() {
    return this.data.id;
  }
  location() {
    return this.data.location;
  }
  format() {
    switch (this.data.location.venue_type) {
      case "online":
        return "Online";
      case "in_person":
        return "In-Person";
      case "hybrid":
        return "Hybrid";
    }
  }
  formatIcon() {
    switch (this.data.location.venue_type) {
      case "online":
        return <DevicesIcon className="cbg-btn-label-icon" sx={{ color: grey, fontSize: "small" }} />;
      case "in_person":
        return <GroupIcon className="cbg-btn-label-icon" sx={{ color: grey, fontSize: "small" }} />;
      case "hybrid":
        return <CoPresentIcon className="cbg-btn-label-icon" sx={{ color: grey, fontSize: "small" }} />;
    }
  }
  name() {
    return this.data.name;
  }
  nextDate() {
    return new Date(this.data.next_meeting);
  }
  formattedNextDayName() {
    return this.dfOpts().format(this.nextDate());
  }
  formattedNextTime() {
    return this.tfOpts().format(this.nextDate());
  }
  dayName() {
    return Meeting.dayNames[this.nextDate().getDay()];
  }
  dayNameShort() {
    return Meeting.dayNamesShort[this.nextDate().getDay()];
  }
  region() {
    return `${this.data.location.city}, ${this.data.location.state_providence}\n${this.data.location.country_common_name}`;
  }
  affinities() {
    return new Intl.DateTimeFormat(this.localeOptions(), { dateStyle: "short", timeStyle: "short" }).format(this.nextDate());
  }
  time() {
    return this.nextDate().getTime();
  }
  slug() {
    return this.data.slug;
  }
  locationName() {
    return this.data.location.name;
  }
  locationSlug() {
    return this.data.location.slug;
  }
  formattedAddress() {
    const { street_address_1, city, state_providence, country_common_name } = this.location();
    return `${city}, ${state_providence}\n${country_common_name}`;
  }
}
