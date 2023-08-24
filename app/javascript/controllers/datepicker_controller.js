import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = [ "startTime", "endTime" ]

  static values = {
    startDate: String,
    endDate: String
  }

  connect() {
    const startDate = document.querySelector("#booking-date-form").dataset.sdate;
    const endDate = document.querySelector("#booking-date-form").dataset.edate;

    console.log(startDate)
    console.log(endDate)
    console.log(this.element);

    // console.log(this.startDateValue)

    flatpickr(this.element,
      {
        // Calendar will be displayed inline
        inline: true,
        // Enabling range(s) of dates:
        enable: [
          {
              from: startDate,
              to: endDate
          }],
        mode: "range",
        minDate: "today",
        dateFormat: "Y-m-d",
        disable: [
            function(date) {
                // disable every multiple of 8
                return !(date.getDate() % 8);
            }
        ]
    })
  }
}
