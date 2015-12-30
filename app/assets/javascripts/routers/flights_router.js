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
    console.log('save result')
    var text = $('.flight-result textarea').val();
    var price = text.match(/\$\d+/)[0];
    var leg1 = text.match(/\d:.+/)[0];
    var leg2 = text.match(/\d:.+$/)[0];

    var airport1 = leg1.match(/[A-Z]{3}/)[0];
    var index1 = leg1.indexOf(airport1) + airport1.length;
    leg1 = leg1.slice(0, index1) + ' =&gt;' + leg1.slice(index1);

    var airport2 = leg2.match(/[A-Z]{3}/)[0];
    var index2 = leg2.indexOf(airport2) + airport2.length;
    leg2 = leg2.slice(0, index2) + ' =&gt;' + leg2.slice(index2);

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
