


// We need the user Input to be the location of the user
// Fetch request to mapbox to get the accurate zone
// Get the

const showMap = (userInput) => {
  // TODO: Construct the URL (with apiKey & userInput) and make the fetch request to the mapbox API
  const apiKey = "pk.eyJ1IjoianBlcmVpcmE5NSIsImEiOiJjbGwwcGtpaTcwMGszM2VtY3psdG5kajRxIn0.-j04GPTh2X0wX0CNhEkXcg";
  const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${userInput}.json?access_token=${apiKey}`;

  fetch(url)
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      const long = data.features[0].center[0];
      const lat = data.features[0].center[1];
      coordinates.innerText = `LONG: ${long}    LAT: ${lat}`;

      mapboxgl.accessToken = apiKey;
      const map = new mapboxgl.Map({
        container: "map",
        style: "mapbox://styles/mapbox/streets-v9",
        center: [long, lat],
        zoom: 12
      });
      // - Add a marker to the map at the coordinates
      new mapboxgl.Marker()
        .setLngLat([long, lat])
        .addTo(map);
    });
};
