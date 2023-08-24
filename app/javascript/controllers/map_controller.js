import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      // style: "mapbox://styles/mapbox/streets-v10"
      // style: "mapbox://styles/dejwhitehead/cllpedsnb005501r7fvte4i64"
      // style: "mapbox://styles/mapbox/satellite-streets-v12"
      style: "mapbox://styles/mapbox/light-v11"
      // styles "mapbox://styles/dejwhitehead/cllpf2rso005601r79xr33j4t"
      // styles : "mapbox://styles/mapbox/outdoors-v12"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

#addMarkersToMap() {
  this.markersValue.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(this.map)
  })
}

#fitMapToMarkers() {
  const bounds = new mapboxgl.LngLatBounds()
  this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
  this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
}
}
