RaveRepeat.Routers.Trips = Backbone.Router.extend({
  routes: {

  },

  initialize: function() {
    var raver_id = $('.raver').attr('data-id');
    var pastTrips, upcomingTrips,
        pastTripsView, upcomingTripsView;
    this.showTrips(raver_id, '.trips div.upcoming', 'upcoming=true', upcomingTrips, upcomingTripsView);
    this.showTrips(raver_id, '.trips div.past', 'past=true', pastTrips, pastTripsView);
    this.renderFlights(); // When cusomizing trips
  },

  showTrips: function(raver_id, el, params, collection, listView) {
    this.collection = new RaveRepeat.Collections.Trips();
    this.listView = new RaveRepeat.Views.TripsView({
      collection: this.collection,
      el: $(el)
    });

    this.collection.url = '/ravers/'+raver_id+'/trips?'+params;
    this.collection.fetch({async: false});
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
      done: flightsView.render
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
  }

});
