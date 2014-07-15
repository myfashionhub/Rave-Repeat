RaveRepeat.Routers.Trips = Backbone.Router.extend({
  routes: {
    '': 'index'
  },

  initialize: function() {
    this.trips = new RaveRepeat.Collections.Trips();
    var that = this;

    this.tripsIndex = new RaveRepeat.Views.TripsIndex({
      collection: this.trips
    });

    this.trips.fetch({async: false});
    this.body = $('.current-trips');
    return this;
  },

  index: function() {
    this.body.html(this.tripsIndex.render().el);
  }

});


