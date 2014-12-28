RaveRepeat.Routers.Trips = Backbone.Router.extend({
  routes: {
    'itinerary': 'renderFlights'
  },

  initialize: function() {
    var raver_id = $('.raver').attr('data-id');
    var pastTrips, upcomingTrips,
        pastTripsView, upcomingTripsView;
    this.showTrips(raver_id, '.trips div.upcoming', 'upcoming=true', upcomingTrips, upcomingTripsView);
    this.showTrips(raver_id, '.trips div.past', 'past=true', pastTrips, pastTripsView);
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
    var trip_id = $('#trip-info').attr('trip-data');
    var flights = new RaveRepeat.Collections.Flights();
    flights.url = '/trips/'+ trip_id + '/flights';

    var flightsView = new RaveRepeat.Views.FlightsView({
      collection: flights,
      el: $('.current-flight')
    });

    flights.fetch({ done: flightsView.render });
  },

  renderFlights: function() {
    console.log('render flights route')
    this.showFlights();
    currentLineup();
  },

  menuNav: function() {
    _.extend($('.trip-menu a'), Backbone.Events);
    _.extend($('#save-lineup'), Backbone.Events);
  }

});
