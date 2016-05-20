window.onload = ->

  map = document.getElementById 'map'
  mapLatlng = new google.maps.LatLng map.getAttribute('data-lat'), map.getAttribute('data-lng')

  mapOptions =
    zoom: 15
    center: mapLatlng
    scrollwheel: false

  map = new google.maps.Map map, mapOptions
  infowindow = new google.maps.InfoWindow maxWidth:300

  marker = new google.maps.Marker(
      map: map
      position: mapLatlng
      animation: google.maps.Animation.DROP,
    )

  html =  '<div class="info-window">'
  html += '<h4>South London Touch Rugby Club</h4>'
  html += '</div>'
  infowindow.setContent html

  google.maps.event.addListener marker, 'click', ->
    infowindow.open map, @
