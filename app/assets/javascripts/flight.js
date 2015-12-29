function Flight() {
  var that = this;

  this.init = function() {
    this.findAirportCode();
    this.suggestAirports();

    $('#search-flight').click(flightSearch);
    $('.search-flight').submit(flightSearch);
  };

  var flightSearch = function(e) {
    e.preventDefault();
    updateTrip();
    that.searchKayak();
  };

  this.findAirportCode = function() {
    var location2 = $('#to-airport').val();
    for (var i=0; i < airports.length; i++) {
      if (airports[i].indexOf(location2) > -1) {
        this.airport2 = airports[i].match(/\(.{3}\)/)[0].replace(/\W/g,'');
        return;
      }
    }
  };

  this.searchKayak = function() {
    this.baseUrl = 'http://www.kayak.com/flights/';
    this.airport1 = $('#from-airport').attr('data-code');
    this.date1 = $('#depart-date').val();
    this.date2 = $('#return-date').val();

    var url = this.baseUrl+this.airport1+'-'+this.airport2+'/'+
              this.date1+'/'+this.date2;
  };

  this.suggestAirports = function() {
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
  };

  this.init();
}
