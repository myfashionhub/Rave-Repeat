window.RaveRepeat = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function() {
    var tripsRouter = new RaveRepeat.Routers.Trips();
    Backbone.history.start({pushState: true});
  }

};

$(document).ready(function() {
  RaveRepeat.initialize();
});
