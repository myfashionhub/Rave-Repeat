$(function() {
  var flightSearch = function(e) {
    e.preventDefault()
    updateTrip();
    searchFlight();
  }
  $('#search-flight').click(flightSearch);
  $('.search-flight').submit(flightSearch);

  var flightRouter = new RaveRepeat.Routers.Flights();
});

function searchFlight() {
  var location1 = $('#from-airport').val().replace(' ', '%20'),
      location2 = $('#to-airport').val().replace(' ', '%20'),
      date1 = $('#depart-date').val(),
      date2 = $('#return-date').val(),
      base_url = 'http://www.kayak.com/s/search/air?',
      query    = 'l1='+location1+'&l2='+location2+
      '&df=mdy&d1='+date1+'&d2='+date2+'&ns=y';
  window.open(base_url+query);
}


function suggestAirports() {
  $('#from-airport').autocomplete({
    source: airports,
    minLength: 2,
    select: function(e, ui) {
      e.preventDefault();
      var cityAirport = ui.item.value;
      var airport = cityAirport.match(/\(.{3}\)/);
      var city = cityAirport.split(' - ')[0];
      $('#from-airport').val(city+' '+airport)
    }
  });
}
