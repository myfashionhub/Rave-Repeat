var GoRaver = GoRaver || { Models: {}, Collections: {}, Views: {}, Routers: {} };

GoRaver.initialize = function() {
  var trips = new GoRaver.Collections.Trips();
  var flights = new GoRaver.Collections.Flights();
  var flightsView = new GoRaver.Views.FlightsView({
    collection: flights,
    el        : $('.flight-results')
  })
}

$(document).ready(function() {
  GoRaver.initialize();
})

