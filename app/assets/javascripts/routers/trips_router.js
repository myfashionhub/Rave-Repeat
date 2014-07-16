RaveRepeat.Routers.Trips = Backbone.Router.extend({
  routes: {
    '': 'index'
  },

  initialize: function() {
    this.trips = new RaveRepeat.Collections.Trips();
    debug = this.trips;
    this.tripsIndex = new RaveRepeat.Views.TripsIndex({
      collection: this.trips
    });
    this.trips.fetch({async: false});
    this.body = $('.trips');
    return this;
  },

  index: function() {
    this.body.html(this.tripsIndex.render().el);
  }

});


