import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

// transforms a date object in a ISO8601 compatible format of the date
// i.e. new Date(2023, 8, 25) -> 2023-08-25
function formatDate(date) {
  const year = date.getUTCFullYear().toString();
  const month = (date.getMonth() + 1).toString().padStart(2, "0");
  const day = date.getDate().toString().padStart(2, "0");
  return `${year}-${month}-${day}`;
}

// Connects to data-controller="datepicker"
export default class extends Controller {
  // this.startTarget = document.querySelector('data-datepicker-target=["start"]')
  static targets = ["start", "end", "calendar"]

  connect() {
    const isInRange = (date, startString, endString) => {
      const start = new Date(Date.parse(startString));
      const end = new Date(Date.parse(endString));
      return date >= formatDate(start) && date <= formatDate(end);
    };

    const isAvailable = (date) => {
      const hasAvailability = window.petAvailabilities.some(({ start_date, end_date }) => {
        return isInRange(formatDate(date), start_date, end_date);
      });
      const hasBooking = window.petBookings.some(({ start_date, end_date }) => {
        return isInRange(formatDate(date), start_date, end_date);
      });
      return hasAvailability && !hasBooking;
    };

    flatpickr(this.calendarTarget,
      {
        // Calendar will be displayed inline
        inline: true,
        enable: [isAvailable],
        mode: "range",
        minDate: "today",
        dateFormat: "Y-m-d",
        onChange: (selectedDates, dateStr, instance) => {
          if (selectedDates.length === 2) {
            this.startTarget.value = formatDate(selectedDates[0]);
            this.endTarget.value = formatDate(selectedDates[1]);
          }
        },
      })
  }
}
