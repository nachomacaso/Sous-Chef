// This example requires the Places library. Include the libraries=places
// parameter when you first load the API. For example:
// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

var map;
var infowindow;

function initMap() {
  var pyrmont = {lat: 41.888719, lng: -87.636867};

  map = new google.maps.Map(document.getElementById('map'), {
    center: pyrmont,
    zoom: 15
  });

  infowindow = new google.maps.InfoWindow();
  var service = new google.maps.places.PlacesService(map);
  service.nearbySearch({
    location: pyrmont,
    radius: 1600,
    type: ['store']
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

// When the window has finished loading create our google map below
google.maps.event.addDomListener(window, 'load', init);

function init() {
    // Basic options for a simple Google Map
    // For more options see: https://developers.google.com/maps/documentation/javascript/reference#MapOptions
    var mapOptions = {
        // How zoomed in you want the map to start at (always required)
        zoom: 14,
        scrollwheel: false,
        navigationControl: false,
        mapTypeControl: false,
        scaleControl: false,

        // The latitude and longitude to center the map (always required)
        center: new google.maps.LatLng(40.6700, -73.9400), // New York

        // How you would like to style the map. 
        // This is where you would paste any style found on Snazzy Maps.
        styles: [{
            "featureType": "administrative",
            "elementType": "all",
            "stylers": [{
                "visibility": "on"
            }, {
                "lightness": 33
            }]
        }, {
            "featureType": "administrative",
            "elementType": "labels",
            "stylers": [{
                "saturation": "-100"
            }]
        }, {
            "featureType": "administrative",
            "elementType": "labels.text",
            "stylers": [{
                "gamma": "0.75"
            }]
        }, {
            "featureType": "administrative.neighborhood",
            "elementType": "labels.text.fill",
            "stylers": [{
                "lightness": "-37"
            }]
        }, {
            "featureType": "landscape",
            "elementType": "geometry",
            "stylers": [{
                "color": "#f9f9f9"
            }]
        }, {
            "featureType": "landscape.man_made",
            "elementType": "geometry",
            "stylers": [{
                "saturation": "-100"
            }, {
                "lightness": "40"
            }, {
                "visibility": "off"
            }]
        }, {
            "featureType": "landscape.natural",
            "elementType": "labels.text.fill",
            "stylers": [{
                "saturation": "-100"
            }, {
                "lightness": "-37"
            }]
        }, {
            "featureType": "landscape.natural",
            "elementType": "labels.text.stroke",
            "stylers": [{
                "saturation": "-100"
            }, {
                "lightness": "100"
            }, {
                "weight": "2"
            }]
        }, {
            "featureType": "landscape.natural",
            "elementType": "labels.icon",
            "stylers": [{
                "saturation": "-100"
            }]
        }, {
            "featureType": "poi",
            "elementType": "geometry",
            "stylers": [{
                "saturation": "-100"
            }, {
                "lightness": "80"
            }]
        }, {
            "featureType": "poi",
            "elementType": "labels",
            "stylers": [{
                "saturation": "-100"
            }, {
                "lightness": "0"
            }]
        }, {
            "featureType": "poi.attraction",
            "elementType": "geometry",
            "stylers": [{
                "lightness": "-4"
            }, {
                "saturation": "-100"
            }]
        }, {
            "featureType": "poi.park",
            "elementType": "geometry",
            "stylers": [{
                "color": "#c5dac6"
            }, {
                "visibility": "on"
            }, {
                "saturation": "-95"
            }, {
                "lightness": "62"
            }]
        }, {
            "featureType": "poi.park",
            "elementType": "labels",
            "stylers": [{
                "visibility": "on"
            }, {
                "lightness": 20
            }]
        }, {
            "featureType": "road",
            "elementType": "all",
            "stylers": [{
                "lightness": 20
            }]
        }, {
            "featureType": "road",
            "elementType": "labels",
            "stylers": [{
                "saturation": "-100"
            }, {
                "gamma": "1.00"
            }]
        }, {
            "featureType": "road",
            "elementType": "labels.text",
            "stylers": [{
                "gamma": "0.50"
            }]
        }, {
            "featureType": "road",
            "elementType": "labels.icon",
            "stylers": [{
                "saturation": "-100"
            }, {
                "gamma": "0.50"
            }]
        }, {
            "featureType": "road.highway",
            "elementType": "geometry",
            "stylers": [{
                "color": "#c5c6c6"
            }, {
                "saturation": "-100"
            }]
        }, {
            "featureType": "road.highway",
            "elementType": "geometry.stroke",
            "stylers": [{
                "lightness": "-13"
            }]
        }, {
            "featureType": "road.highway",
            "elementType": "labels.icon",
            "stylers": [{
                "lightness": "0"
            }, {
                "gamma": "1.09"
            }]
        }, {
            "featureType": "road.arterial",
            "elementType": "geometry",
            "stylers": [{
                "color": "#e4d7c6"
            }, {
                "saturation": "-100"
            }, {
                "lightness": "47"
            }]
        }, {
            "featureType": "road.arterial",
            "elementType": "geometry.stroke",
            "stylers": [{
                "lightness": "-12"
            }]
        }, {
            "featureType": "road.arterial",
            "elementType": "labels.icon",
            "stylers": [{
                "saturation": "-100"
            }]
        }, {
            "featureType": "road.local",
            "elementType": "geometry",
            "stylers": [{
                "color": "#fbfaf7"
            }, {
                "lightness": "77"
            }]
        }, {
            "featureType": "road.local",
            "elementType": "geometry.fill",
            "stylers": [{
                "lightness": "-5"
            }, {
                "saturation": "-100"
            }]
        }, {
            "featureType": "road.local",
            "elementType": "geometry.stroke",
            "stylers": [{
                "saturation": "-100"
            }, {
                "lightness": "-15"
            }]
        }, {
            "featureType": "transit.station.airport",
            "elementType": "geometry",
            "stylers": [{
                "lightness": "47"
            }, {
                "saturation": "-100"
            }]
        }, {
            "featureType": "water",
            "elementType": "all",
            "stylers": [{
                "visibility": "on"
            }, {
                "color": "#acbcc9"
            }]
        }, {
            "featureType": "water",
            "elementType": "geometry",
            "stylers": [{
                "saturation": "53"
            }]
        }, {
            "featureType": "water",
            "elementType": "labels.text.fill",
            "stylers": [{
                "lightness": "-42"
            }, {
                "saturation": "17"
            }]
        }, {
            "featureType": "water",
            "elementType": "labels.text.stroke",
            "stylers": [{
                "lightness": "61"
            }]
        }]
    };

    // Get the HTML DOM element that will contain your map 
    // We are using a div with id="map" seen below in the <body>
    var mapElement = document.getElementById('map');

    // Create the Google Map using our element and options defined above
    var map = new google.maps.Map(mapElement, mapOptions);

    // Let's also add a marker while we're at it
    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(40.6700, -73.9400),
        map: map,
        title: 'Snazzy!'
    });