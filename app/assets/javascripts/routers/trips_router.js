RaveRepeat.Routers.Trips = Backbone.Router.extend({
  routes: {

  },

  initialize: function() {
    var raver_id = $('.raver').attr('data-id');
    this.showPastTrips(raver_id);
    this.showUpcomingTrips(raver_id);
    this.renderFlights(); // When cusomizing trips
  },

  showUpcomingTrips: function(raver_id) {
    this.tripsUpcoming = new RaveRepeat.Collections.Trips();
    this.tripsViewUpcoming = new RaveRepeat.Views.TripsView({
      collection: this.tripsUpcoming,
      el: $('.trips .upcoming')
    });

    this.tripsUpcoming.url = '/ravers/'+raver_id+'/trips?upcoming=true';
    this.tripsUpcoming.fetch({async: false});
    console.log('show upcoming')
  },

  showPastTrips: function(raver_id) {
    this.tripsPast = new RaveRepeat.Collections.Trips();
    this.tripsViewPast = new RaveRepeat.Views.TripsView({
      collection: this.tripsPast,
      el: $('.trips .past')
    });

    this.tripsPast.url = '/ravers/'+raver_id+'/trips?past=true';
    this.tripsPast.fetch({async: false});
    console.log('show past')
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
