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
  })
}

function spreadPLUR() {
  $('#share').mouseenter(function() {

  })
}

function flightsRender() {
  _.extend($('.itinerary-tab'), Backbone.Events);
  _.extend($('#save-lineup'), Backbone.Events);
  $('.itinerary-tab').click(function() {
    RaveRepeat.showFlights();
  });

  $('#save-lineup').click(RaveRepeat.showFlights);

}
