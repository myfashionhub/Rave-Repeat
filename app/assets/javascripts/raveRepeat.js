window.RaveRepeat = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function() {
    //Backbone.history.start({pushState: true});
    var artistsRouter;
    var raverRouter = new RaveRepeat.Routers.Ravers();
    var hotelRouter = new RaveRepeat.Routers.Hotels();
    var flightRouter;
  }

};

var tripId, festivalId, currentLineup, officialLineup;

$(document).ready(function() {

	festivalId = $('#trip-info').attr('festival-data');
	RaveRepeat.initialize();

});
