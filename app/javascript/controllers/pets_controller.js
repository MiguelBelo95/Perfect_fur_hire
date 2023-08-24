import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pets"
export default class extends Controller {
  connect() {

    console.log("hello from pets controller")
  }
}

// document.addEventListener("load", () => {
//   console.log("Hi miguel!")

// })
