RaveRepeat.Routers.Trips = Backbone.Router.extend({
  routes: {

  },

  initialize: function() {
    this.trips = new RaveRepeat.Collections.Trips();
    this.tripsIndex = new RaveRepeat.Views.TripsView({
      collection: this.trips,
      el: $('.trips')
    });
    this.trips.fetch({async: false});
    this.renderFlights();
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

  renderFlights: function() {
    var that = this;
    _.extend($('.itinerary-tab'), Backbone.Events);
    _.extend($('#save-lineup'), Backbone.Events);

    $('.itinerary-tab').click(function() {
      that.showFlights();
      currentLineup();
      console.log('show flights')
    });

    $('#save-lineup').click(function() {
      that.showFlights();
      currentLineup();
    });
  },

  showRavers: function(id, el) {
    var ravers = new RaveRepeat.Collections.Ravers();
    ravers.url = '/festivals/' + id;
    var raversView = new RaveRepeat.Views.RaversView({
      collection: ravers,
      el: el
    });

    ravers.fetch({ success: raversView.render });
  }

});
