import { Controller } from "@hotwired/stimulus"

// Initialize and add the map

let map;

async function initMap() {
  const position = { lat: 51.5252039, lng: -0.1921014 };
  // Request needed libraries.
  //@ts-ignore
  const { Map } = await google.maps.importLibrary("maps");

  // The map, centered at London
  return new Map(document.getElementById("map"), {
    zoom: 11,
    center: position,
    mapId: "DEMO_MAP_ID",
  });
}

window.addEventListener("load", async () => {
  const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");

  const map = await initMap();
  const postCode = "W1K 2AL";
  const request = await fetch(`https://findthatpostcode.uk/postcodes/${postCode.replace(" ", "+")}.json`);
  const data = await request.json();
  const location = data.data.attributes.location;
  const position = { lat: location.lat, lng: location.lon };
  const marker = new AdvancedMarkerElement({
    map: map,
    position: position,
    title: "Test"
  });
});


export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
  }
}
