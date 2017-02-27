// This example requires the Places library. Include the libraries=places
// parameter when you first load the API. For example:
// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

var map;
var infoWindow;

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

  var pyrmont = {lat: 41.8789, lng: -87.6359};

  map = new google.maps.Map(document.getElementById('map'), {
    center: pyrmont,
    zoom: 15
  });

  //Associate the styled map with the MapTypeId and set it to display.
  map.mapTypes.set('styled_map', styledMapType);
  map.setMapTypeId('styled_map');

  infoWindow = new google.maps.InfoWindow();

  if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var pos = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };
        
        var service = new google.maps.places.PlacesService(map);
        service.nearbySearch({
          location: pos,
          radius: 1600,
          openNow: true,
          type: ['grocery_or_supermarket']
        }, callback);

        map.setCenter(pos);
      }, function() {
        handleLocationError(true, infoWindow, map.getCenter());
      });
    } else {
      // Browser doesn't support Geolocation
      handleLocationError(false, infoWindow, map.getCenter());
    }
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


  var image = "/assets/grocery-marker-09b4351fab35809d7f07c8f531608e2d02281e2da28492dd291fa79f0c6053ca.png";

  var marker = new google.maps.Marker({
    map: map,
    position: place.geometry.location,
    icon: image
  });


  google.maps.event.addListener(marker, 'click', function() {
    infoWindow.setContent(place.name);
    infoWindow.open(map, this);
  });
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(browserHasGeolocation ?
                        'Error: The Geolocation service failed.' :
                        'Error: Your browser doesn\'t support geolocation.');
}
;
