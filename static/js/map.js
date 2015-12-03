    // Provide access token
    L.mapbox.accessToken = 'pk.eyJ1IjoiYmh1c2hhbmgwMDciLCJhIjoiY2loZ3hhdWlxMG1mNHRjbHo2M2Z2Y2ZvdCJ9.nYBRCWB3gv-IjutuKYpTTg';

    // Set up map characteristics and layers
    var map = L.mapbox.map('map', 'bhushanh007.ob005147')
            .addLayer(L.mapbox.tileLayer('bhushanh007.ob005147'))
            .addControl(L.mapbox.geocoderControl('mapbox.places', { //user can enter in address
            autocomplete: true                                      // address will be autocompleted    
                }));
            L.control.locate().addTo(map); //allows user to locate themselves

    console.log("map is set up");

    // Set location to be San Francisco
    var geocoder = L.mapbox.geocoder('mapbox.places');

    geocoder.query('San Francisco, CA', showMap);   //will zoom into San Francisco

    function showMap(err, data) {
        // The geocoder can return an area, like a city, or a
        // point, like an address. Here we handle both cases,
        // by fitting the map bounds to an area or zooming to a point.
        if (data.lbounds) {
            map.fitBounds(data.lbounds);
        } else if (data.latlng) {
            map.setView([data.latlng[0], data.latlng[1]], 13);
        }
    };

    // new L.Control.Zoom({ position: 'topleft' }).addTo(map);