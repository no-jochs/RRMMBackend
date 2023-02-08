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
  constructor(data) {
    this.data = data;
  }
  id() {
    return this.data.id;
  }
  location() {
    return this.data.location;
  }
  venue() {
    return this.data.location.venue_type;
  }
  name() {
    return this.data.name;
  }
  nextDate() {
    return new Date(this.data.next_meeting);
  }
  dayName() {
    return Meeting.dayNames[this.nextDate().getDay()];
  }
  region() {
    return `${this.data.location.city}, ${this.data.location.state_providence}\n${this.data.location.country_common_name}`;
  }
  affinities() {
    return [];
  }
}
