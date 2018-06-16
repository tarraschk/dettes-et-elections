loadmap =(annee) ->
  # Block the UI...
  $.blockUI message: '<h1><img src="loading.gif" /> Chargement en cours,<br/>veuillez patienter...</h1>'

  # Load data
  map.on 'load', ->
    map.addSource 'communes',
      type: 'geojson'
      data: '/donnees_' + annee + '.geojson'
    map.addLayer {
      'id': 'communes-heat'
      'type': 'heatmap'
      'source': 'communes'
      'maxzoom': 9
      'paint':
        'heatmap-weight': [
          'interpolate'
          [ 'linear' ]
          [
            'get'
            'excedent_pct'
          ]
          -30
          5
          -20
          3
          -10
          1
          0
          0.5
          30
          0.1
        ]
        'heatmap-intensity': [
          'interpolate'
          [ 'linear' ]
          [ 'zoom' ]
          0
          1
          9
          3
        ]
        'heatmap-color': [
          'interpolate'
          [ 'linear' ]
          [ 'heatmap-density' ]
          0
          'rgba(33,102,172,0)'
          0.2
          'rgb(103,169,207)'
          0.4
          'rgb(209,229,240)'
          0.6
          'rgb(253,219,199)'
          0.8
          'rgb(239,138,98)'
          1
          'rgb(178,24,43)'
        ]
        'heatmap-radius': [
          'interpolate'
          [ 'linear' ]
          [ 'zoom' ]
          0
          2
          9
          6
        ]
        'heatmap-opacity': [
          'interpolate'
          [ 'linear' ]
          [ 'zoom' ]
          7
          1
          9
          0
        ]
    }, 'waterway-label'

    # Plotting the data
    map.addLayer {
      'id': 'communes-point'
      'type': 'circle'
      'source': 'communes'
      'minzoom': 8
      'paint':
        'circle-color': [
          'interpolate'
          [ 'linear' ]
          [
            'get'
            'excedent_pct'
          ]
          -30
          'rgb(178,24,43)'
          -20
          'rgb(239,138,98)'
          -10
          'rgb(253,219,199)'
          0
          'rgb(209,229,240)'
          10
          'rgb(103,169,207)'
          20
          'rgba(33,102,172,0)'
        ]
        'circle-stroke-color': 'white'
        'circle-stroke-width': 1
        'circle-radius': 10
        'circle-opacity': [
          'interpolate'
          [ 'linear' ]
          [ 'zoom' ]
          6
          0
          7
          1
        ]
    }, 'waterway-label'

    # Adding triggers to data
    map.on 'click', 'communes-point', (e) ->
      coordinates = e.features[0].geometry.coordinates.slice()
      description = e.features[0].properties.description
      # Ensure that if the map is zoomed out such that multiple
      # copies of the feature are visible, the popup appears
      # over the copy being pointed to.
      while Math.abs(e.lngLat.lng - (coordinates[0])) > 180
        coordinates[0] += if e.lngLat.lng > coordinates[0] then 360 else -360
      (new (mapboxgl.Popup)).setLngLat(coordinates).setHTML(description).addTo map
      return

    # Change the cursor to a pointer when the mouse is over the places layer.
    map.on 'mouseenter', 'communes-point', ->
      map.getCanvas().style.cursor = 'pointer'
      return

    # Change it back to a pointer when it leaves.
    map.on 'mouseleave', 'communes-point', ->
      map.getCanvas().style.cursor = ''
      return

    #Unblock the UI
    $.unblockUI()

    return

$ ->
  # Mapbox Initialization
  mapboxgl.accessToken = 'pk.eyJ1IjoibWFwYm94YWp4IiwiYSI6ImNqaTI3dmo5bDBqMDUzcHBqZmVwdXB2ZGkifQ.gczJjTmhDJeUtt8SEYpDcQ'
  window.map = new (mapboxgl.Map)(
    container: 'map'
    style: 'mapbox://styles/mapbox/streets-v9'
    center: [
      1.800390625
      47.26538735632654
    ]
    zoom: 5)

  annee = $('[name=rangeYear]').val();

  loadmap(annee);

  $('[name="rangeYear"]').on 'change', ->
    console.log 'toto'
    loadmap($('[name=rangeYear]').val())
    return

  return
