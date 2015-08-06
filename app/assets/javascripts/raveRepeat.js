window.RaveRepeat = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function() {
    //Backbone.history.start({pushState: true});
    var artistsRouter = new RaveRepeat.Routers.Artists();
    var raverRouter = new RaveRepeat.Routers.Ravers();
    var flightRouter = new RaveRepeat.Routers.Flights();
    var hotelRouter = new RaveRepeat.Routers.Hotels();

    detectTripSection();
  }

};

var tripId, festivalId, currentLineup, officialLineup;

$(document).ready(function() {

	tripId = $('#trip-info').attr('trip-data');
	festivalId = $('#trip-info').attr('festival-data');

	RaveRepeat.initialize();
});
