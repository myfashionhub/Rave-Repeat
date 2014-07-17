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
  },

  showFlights: function() {
    var trip_id = $('#trip-id').val();
    var flights = new RaveRepeat.Collections.Flights();
    flights.url = '/trips/'+ trip_id + '/flights';

    var flightsView = new RaveRepeat.Views.FlightsView({
      collection: flights,
      el: $('.current-flight')
    });

    flights.fetch({
      success: flightsView.render
    });
  },

  showRavers: function(id, el) {
    var ravers = new RaveRepeat.Collections.Ravers();
    ravers.url = '/festivals/' + id;
    var raversView = new RaveRepeat.Views.RaversView({
      collection: ravers,
      el: el
    });

    ravers.fetch({ success: function() {
        $('.ravers').empty();
        raversView.render();
      }
    })
  }

};

