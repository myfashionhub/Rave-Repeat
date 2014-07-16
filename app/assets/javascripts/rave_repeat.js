window.RaveRepeat = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function() {
    var tripsRouter = new RaveRepeat.Routers.Trips();
    //var flightsRouter = new RaveRepeat.Routers.Flights();
    Backbone.history.start();
  }
};

