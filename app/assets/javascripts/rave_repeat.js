window.RaveRepeat = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function() {
    this.trips = new RaveRepeat.Collections.Trips();
    this.tripsIndex = new RaveRepeat.Views.TripsView({
      collection: this.trips,
      el: $('.trips')
    });
    this.trips.fetch({async: false});
  }
};

