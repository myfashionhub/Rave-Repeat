RaveRepeat.Routers.Flights = Backbone.Router.extend({

  initialize: function() {
    var that = this;
    this.showFlights();
    $('.continue-btn').first().addClass('active');

    $('.lineup.continue-btn').click(that.showFlights);
    $('.trip-menu .itinerary').click(that.showFlights);

    $('#view-flights').click(that.viewSearchResults);
    $('form.view-flights').submit(that.viewSearchResults)
  },

  viewSearchResults: function(e) {
    // Search results via Kayak module
    var that = this;
    e.preventDefault();

    var url = $('.result-url').val();
    var flights = new RaveRepeat.Collections.Flights();
    var flightsView = new RaveRepeat.Views.FlightsView({
      collection: flights,
      el: $('.flight-results')
    });    

    flights.url = '/flights/search?url='+url
    flights.fetch({async: false,
      success: function(response) {},
      error: function() {
        notify('Cannot fetch flights at the moment.', 'error')
      }
    });

    $('.flight.continue-btn').addClass('active');
  },

  showFlights: function() {
    // Show saved flights of the current trip

    var trip_id = $('#trip-info').attr('trip-data');
    var flights = new RaveRepeat.Collections.Flights();
    flights.url = '/trips/'+ trip_id + '/flights';

    var flightsView = new RaveRepeat.Views.FlightsView({
      collection: flights,
      el: $('.current-flight')
    });

    flights.fetch({ done: flightsView.render });
  }

});
