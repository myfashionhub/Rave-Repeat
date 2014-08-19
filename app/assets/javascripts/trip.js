function updateTrip() {
  var fromAirport = $('#from-airport').val();
  var toAirport   = $('#to-airport').val();
  var startDate   = $('#depart-date').val();
  var endDate     = $('#return-date').val();
  var tripId      = $('#trip-id').val();

  $.ajax({
    url: '/trips/'+tripId,
    method: 'put',
    dataType: 'json',
    data: { from_airport: fromAirport, to_airport: toAirport, start_date: startDate, end_date: endDate },
    success: function() { console.log("Trip updated"); }
  });
}

function spreadPLUR() {
  $('#share').mouseenter(function() {

  });
}

function currentLineup() {
  var tripId = $('#trip-id').val();
  $.ajax({
    url: '/trips/'+tripId+'/lineup',
    method: 'get',
    dataType: 'json',
    success: function(data) {
      var artists = data.lineup;
      $('.current-lineup ul').empty();

      _.each(artists, function(artist) {
        var artistLi = $('<li>').html(artist);
        $('.current-lineup ul').append(artistLi);
      });
    }
  });
}

function renderFlights() {
  _.extend($('.itinerary-tab'), Backbone.Events);
  _.extend($('#save-lineup'), Backbone.Events);
  $('.itinerary-tab').click(function() {
    RaveRepeat.showFlights();
  });

  $('#save-lineup').click(function() {
    RaveRepeat.showFlights();
    currentLineup();
  });
}
