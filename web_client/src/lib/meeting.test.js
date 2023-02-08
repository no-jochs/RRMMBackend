import Meeting from "./meeting.js";

const meetingData = {
  id: 1002,
  name: "Cassin, Kerluke and West Meeting",
  start_date: "2021-02-10T03:07:41.292Z",
  next_meeting: "2023-02-08T03:07:00.000Z",
  duration: 90,
  notes: "Culpa magni atque. Enim fugiat soluta. Aspernatur ea beatae.",
  conference_link: "https://zoom.link.com",
  group_resources: {},
  location_id: 1001,
  language: "english",
  slug: "plain_authority",
  visible: true,
  status: "approved",
  created_at: "2023-02-08T06:56:24.311Z",
  updated_at: "2023-02-08T06:56:24.311Z",
  location: {
    id: 1001,
    name: "D'Amore, Pouros and McDermott",
    slug: "outside-general",
    street_address_1: "9918 Elfriede Mall",
    street_address_2: "Apt. 484",
    city: "Lehnerfurt",
    state_providence: "MA",
    country: "ET",
    country_common_name: "Ethiopia",
    postal_code: "26846-6262",
    timezone_identifier: "Etc/UTC",
    timezone_name: "Etc/UTC",
    utc_offset: 0,
    latitude: "62.530425397201",
    longitude: "-170.567194684699",
    notes: "Qui accusamus in. Beatae consequuntur maiores. Illo explicabo eum.",
    venue_type: "online",
    status: "approved",
    created_at: "2023-02-08T06:56:24.310Z",
    updated_at: "2023-02-08T06:56:24.310Z",
  },
};

const subject = new Meeting(meetingData);

describe("Meeting", () => {
  describe("nextDate", () => {
    test("returns a Date object", () => {
      expect(subject.nextDate()).toBeInstanceOf(Date);
    });
  });

  describe("dayName", () => {
    test("returns a string", () => {
      expect(typeof subject.dayName()).toBe("string");
    });

    test("is equal to Saturday", () => {
      expect(subject.dayName()).toBe("Saturday");
    });
  });
});
