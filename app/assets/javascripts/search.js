function searchFlight() {
  var location1 = $('#from-airport').val().replace(' ', '%20');
  var location2 = $('#to-airport').val().replace(' ', '%20');
  var date1 = $('#depart-date').val().replace('/', '%2F');
  var date2 = $('#return-date').val().replace('/', '%2F');
  var base_url = 'http://www.kayak.com/s/search/air?';
  var query    = 'l1='+location1+'&l2='+location2+'&df=mdy&d1='+date1+'&d2='+date2+'&ns=y';
  window.open(base_url+query);
}

function viewFlights() {
  var url = $('.result-url').val();
  $.ajax({
    url: '/flights',
    method: 'post',
    data: { url: url },
    dataType: 'json',
    success: function(data) {
      console.log(data);
      displayFlights(data); }
  });
}

function displayFlights(data) {
  for (var i = 0; i < data.length; i++) {
    var airline = data[i].airline;
    var fromAirport1 = data[i].leg1_airport1;
    var toAirport1   = data[i].leg1_airport2;
    var fromTime1    = data[i].leg1_time1;
    var toTime1      = data[i].leg1_time2;
    var duration1    = data[i].leg1_duration;

    var airline = data[i].airline;
    var fromAirport2 = data[i].leg2_airport1;
    var toAirport2   = data[i].leg2_airport2;
    var fromTime2    = data[i].leg2_time1;
    var toTime2      = data[i].leg2_time2;
    var duration2    = data[i].leg2_duration;

    var price        = data[i].price;
    var link         = data[i].link;

    var trip = $('<article>').addClass('trip');
    var leg1 = $('<p>').html('Depart: '+fromAirport1 + ' ' + fromTime1 + ' => ' + toAirport1 + ' ' + toTime1 + ' ' + duration1);
    var leg2 = $('<p>').html('Arrive: '+fromAirport2 + ' ' + fromTime2 + ' => ' + toAirport2 + ' ' + toTime2 + ' ' + duration2);
    var buyLink = $('<a>').attr('href', link).attr('target', '_blank');
    var buy  = price + ' from ' + airline;
    buyLink.html(buy);
    var checkbox = $('<input>').attr('type', 'checkbox');
    var save = $('<p>').html('Save this flight').prepend(checkbox);

    trip.append('<h4>'+airline+'</h4>')
        .append(leg1).append(leg2)
        .append(buyLink)
        .append(save);
    $('.flight-results').append(trip);
  }
}

function saveFlight() {

}

$(document).ready(function() {
  $('#search-flight').click(searchFlight);

  $('.view-flights').submit(function(e) {
    e.preventDefault();
    viewFlights();
  });

  $('.save-flight').click(saveFlight);
});


