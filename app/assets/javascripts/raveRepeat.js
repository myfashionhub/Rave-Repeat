window.RaveRepeat = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function() {
    //Backbone.history.start({pushState: true});
    var artistsRouter = new RaveRepeat.Routers.Artists();
    var raverRouter = new RaveRepeat.Routers.Ravers();
    var hotelRouter = new RaveRepeat.Routers.Hotels();
    var flightRouter;

    window.trip = new Trip();
  }

};

var tripId, festivalId, currentLineup, officialLineup;

$(document).ready(function() {

	festivalId = $('#trip-info').attr('festival-data');

	RaveRepeat.initialize();
});
