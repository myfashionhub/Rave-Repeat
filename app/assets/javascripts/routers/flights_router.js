RaveRepeat.Routers.Flights = Backbone.Router.extend({

  initialize: function() {
    var that = this;
    this.viewSearchResults();
    this.renderFlights();

    $('#save-lineup').click(function() {
      that.renderFlights();
    });

    $('.trip-menu .itinerary').click(function() {
      that.renderFlights();
    });
  },

  viewSearchResults: function() {
    // Search results via Kayak module
    var that = this;
    _.extend($('#view-flights'), Backbone.Events);
    _.extend($('.view-flights'), Backbone.Events);

    var viewResults = function(e) {
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
    };

    $('#view-flight').click(viewResults);
    $('.view-flights').submit(viewResults);
  },

  showFlights: function() {
    // Show saved flights of the current trip
    console.log('Show flights')
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
    this.showFlights();
    currentLineup();
  }
});
