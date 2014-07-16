RaveRepeat.Routers.Trips = Backbone.Router.extend({
  routes: {
    '': 'index'
  },

  initialize: function() {
    console.log("BB history started");

    this.trips = new RaveRepeat.Collections.Trips();
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


