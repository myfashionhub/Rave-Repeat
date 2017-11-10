RaveRepeat.Routers.Flights = Backbone.Router.extend({

  initialize: function() {
    var that = this;
    tripId = $('#trip-info').attr('trip-data');

    this.suggestAirports();
    $('.continue-btn').first().addClass('active');

    $('form.search-flight').submit(function(e) { that.search(e); });
    $('form.flight-result').submit(function(e) { that.saveResult(e); });
  },

  search: function(e) {
    var that = this;
    e.preventDefault();
    this.findAirportCode();
    trip.update();

    var baseUrl = 'http://www.kayak.com/flights/';
    this.airport1 = $('#from-airport').val().match(/\(.{3}\)/)[0].
                    replace(/\W/g,'');
    this.date1 = $('#depart-date').val();
    this.date2 = $('#return-date').val();

    var url = baseUrl+this.airport1+'-'+this.airport2+'/'+
              this.date1+'/'+this.date2;
    window.open(url);
    //this.parseResult(url);
  },

  parseResult: function(url) {
    var flights = new RaveRepeat.Collections.Flights();
    var flightsView = new RaveRepeat.Views.FlightsView({
      collection: flights,
      el: $('.flight-results')
    });

    flights.url = '/flights/search?url='+url;
    flights.fetch({
      async: false,
      success: function(response) {},
      error: function() {
        notify('Cannot fetch flights at the moment.', 'error')
      }
    });
  },

  saveResult: function(e) {
    e.preventDefault();
    var that = this;

    var text = $('.flight-result textarea').val();
    /*
      Delta logo Delta 7:00 am JFK nonstop 10:40 am SFO 6h 40m
      Delta logo Delta 4:15 pm SFO nonstop 12:36 am JFK (+1) 5h 21m
      Sponsored Result $671 Delta
    */
    var price = text.match(/\$\d+/)[0];
    var times = text.match(/\d+:\d+\s\wm/g);
    var airports = text.match(/[A-Z]{3}/g);
    var durations = text.match(/\d+h\s\d+m/g);

    // Edge cases: 1 stop over, more than 4 airports
    // Next day arrival
    var leg1 = times[0] + ' ' + airports[0] + ' - ' +
      times[1] + ' ' + airports[1] +
      ' (' + durations[0] + ')';
    var leg2 = times[2] + ' ' + airports[2] + ' - ' +
      times[3] + ' ' + airports[airports.length - 1] +
      ' (' + durations[1] + ')';

    var flight = new RaveRepeat.Models.Flight({
      leg1: leg1,
      leg2: leg2,
      price: price,
      trip_id: tripId
    });

    var flightView = new RaveRepeat.Views.FlightView({model: flight});
    flightView.saveFlight();
  },

  showFlights: function() {
    // Show saved flights of the current trip
    var flights = new RaveRepeat.Collections.Flights();
    flights.url = '/trips/'+ tripId + '/flights';

    var flightsView = new RaveRepeat.Views.FlightsView({
      collection: flights,
      el: $('.current-flight')
    });

    flights.fetch({ done: flightsView.render });
  },

  findAirportCode: function() {
    var location2 = $('#to-airport').val();
    var that = this;

    for (var i=0; i < airports.length; i++) {
      if (airports[i].indexOf(location2) > -1) {
        that.airport2 = airports[i].match(/\(.{3}\)/)[0].replace(/\W/g,'');
        //$('#from-airport').val( $('#from-airport').val() + ' ('+that.airport2+')' );
        return;
      }
    }
  },

  suggestAirports: function() {
    $('#from-airport').autocomplete({
      source: airports,
      minLength: 2,
      select: function(e, ui) {
        e.preventDefault();
        var cityAirport = ui.item.value;
        var airport = cityAirport.match(/\(.{3}\)/)[0].replace(/\W/g,'');
        var city = cityAirport.split(' - ')[0];
        $('#from-airport').val(city+' ('+airport+')').
          attr('data-code', airport);
      }
    });
  }
});
