// This example requires the Places library. Include the libraries=places
// parameter when you first load the API. For example:
// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

var map;
var infowindow;

function initMap() {
  var styledMapType = new google.maps.StyledMapType(
              [
              {"featureType":"water","stylers":[{"color":"#19a0d8"}]},
              {"featureType":"administrative","elementType":"labels.text.stroke","stylers":[{"color":"#ffffff"},{"weight":6}]},
              {"featureType":"administrative","elementType":"labels.text.fill","stylers":[{"color":"#e85113"}]},
              {"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#efe9e4"},{"lightness":-40}]},
              {"featureType":"road.arterial","elementType":"geometry.stroke","stylers":[{"color":"#efe9e4"},{"lightness":-20}]},
              {"featureType":"road","elementType":"labels.text.stroke","stylers":[{"lightness":100}]},
              {"featureType":"road","elementType":"labels.text.fill","stylers":[{"lightness":-100}]},
              {"featureType":"road.highway","elementType":"labels.icon"},{"featureType":"landscape","elementType":"labels","stylers":[{"visibility":"off"}]},
              {"featureType":"landscape","stylers":[{"lightness":20},{"color":"#efe9e4"}]},
              {"featureType":"landscape.man_made","stylers":[{"visibility":"off"}]},
              {"featureType":"water","elementType":"labels.text.stroke","stylers":[{"lightness":100}]},
              {"featureType":"water","elementType":"labels.text.fill","stylers":[{"lightness":-100}]},
              {"featureType":"poi","elementType":"labels.text.fill","stylers":[{"hue":"#11ff00"}]},
              {"featureType":"poi","elementType":"labels.text.stroke","stylers":[{"lightness":100}]},
              {"featureType":"poi","elementType":"labels.icon","stylers":[{"hue":"#4cff00"},{"saturation":58}]},
              {"featureType":"poi","elementType":"geometry","stylers":[{"visibility":"on"},{"color":"#f0e4d3"}]},
              {"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#efe9e4"},{"lightness":-25}]},
              {"featureType":"road.arterial","elementType":"geometry.fill","stylers":[{"color":"#efe9e4"},{"lightness":-10}]},
              {"featureType":"poi","elementType":"labels","stylers":[{"visibility":"simplified"}]}
              ],
              {name: 'Styled Map'});

  var pyrmont = {lat: 41.8885, lng: -87.6354};

  map = new google.maps.Map(document.getElementById('map'), {
    center: pyrmont,
    zoom: 16
  });

  //Associate the styled map with the MapTypeId and set it to display.
  map.mapTypes.set('styled_map', styledMapType);
  map.setMapTypeId('styled_map');

  infowindow = new google.maps.InfoWindow();
  var service = new google.maps.places.PlacesService(map);
  service.nearbySearch({
    location: pyrmont,
    radius: 1600,
    openNow: true,
    type: ['grocery_or_supermarket']
  }, callback);
}

function callback(results, status) {
  if (status === google.maps.places.PlacesServiceStatus.OK) {
    for (var i = 0; i < results.length; i++) {
      createMarker(results[i]);
    }
  }
}

function createMarker(place) {
  var placeLoc = place.geometry.location;
  var marker = new google.maps.Marker({
    map: map,
    position: place.geometry.location
  });


  google.maps.event.addListener(marker, 'click', function() {
    infowindow.setContent(place.name);
    infowindow.open(map, this);
  });
}