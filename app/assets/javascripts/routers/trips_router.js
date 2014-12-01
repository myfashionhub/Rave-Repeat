RaveRepeat.Routers.Trips = Backbone.Router.extend({
  routes: {

  },

  initialize: function() {
    var raver_id = $('.raver').attr('data-id');
    this.showTrips(raver_id, '.trips .upcoming', 'upcoming=true');
    this.showTrips(raver_id, '.trips .past', 'past=true');
    this.renderFlights(); // When cusomizing trips
  },

  showTrips: function(raver_id, el, params) {
    this.trips = new RaveRepeat.Collections.Trips();
    this.tripsView = new RaveRepeat.Views.TripsView({
      collection: this.trips,
      el: $(el)
    });

    this.trips.url = '/ravers/'+raver_id+'/trips?'+params;
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

  hidePastTrips: function() {

  },

  renderFlights: function() {
    var that = this;
    _.extend($('.itinerary-tab'), Backbone.Events);
    _.extend($('#save-lineup'), Backbone.Events);

    $('.itinerary-tab').click(function() {
      that.showFlights();
      currentLineup();
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
