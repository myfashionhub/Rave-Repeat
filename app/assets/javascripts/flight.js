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
    url: '/flights/search',
    method: 'post',
    data: { url: url },
    dataType: 'json',
    success: function(data) {
      displayFlights(data); },
    error: function(data) {
      $('.flight-results').append('Cannot fetch flights at the moment.')
    }
  });
}

function displayFlights(data) {
  for (var i = 0; i < data.length; i++) {
    var airline = data[i].airline;
    var fromAirport1 = data[i].leg1_airport1;
    var toAirport1   = data[i].leg1_airport2;
    var fromTime1    = data[i].leg1_time1;
    var toTime1      = data[i].leg1_time2;
    //var duration1    = data[i].leg1_duration;

    var airline      = data[i].airline;
    var fromAirport2 = data[i].leg2_airport1;
    var toAirport2   = data[i].leg2_airport2;
    var fromTime2    = data[i].leg2_time1;
    var toTime2      = data[i].leg2_time2;
    //var duration2    = data[i].leg2_duration;

    var price        = data[i].price;
    var link         = data[i].link;

    var trip = $('<article>');
    var leg1 = $('<p>').addClass('leg1')
               .html(fromAirport1 + ' ' + fromTime1 + ' => ' + toAirport1 + ' ' + toTime1);
    var leg2 = $('<p>').addClass('leg2')
              .html(fromAirport2 + ' ' + fromTime2 + ' => ' + toAirport2 + ' ' + toTime2);
    var buyLink = $('<a>').attr('href', link)
                          .attr('target', '_blank')
                          .html('Buy now');
    var airlineEl = $("<h4>").addClass('airline').html(airline);
    var priceEl = $("<span>").addClass('price').html(price);
    var checkbox = $('<input>').attr('type', 'checkbox');
    var save = $('<span>').html('Save to intinerary');

    trip.append(airlineEl).append(priceEl)
        .append(leg1).append(leg2)
        .append(buyLink)
        .append(checkbox).append(save);
    $('.flight-results').append(trip).hide().slideDown();
  }
}

function saveFlight() {
  var checkedBoxes = $('input:checked');
  _.each(checkedBoxes, function(checkedBox) {
    var trip = $(checkedBox).parent();
    var leg1 = $(trip.find('p')[0]).html();
    var leg2 = $(trip.find('p')[1]).html();
    var link    = trip.find('a').attr('href');
    var airline = trip.find('.airline').html();
    var price   = trip.find('.price').html();
    var tripId = $('#trip-id').val();
    $.ajax({
      url: '/flights',
      method: 'post',
      data: { leg1: leg1, leg2: leg2, price: price, airline: airline, link: link, trip_id: tripId },
      dataType: 'json',
      success: function() { toggleSection('hotel'); }
    });
  });
}


function suggestAirports() {
  $('#from-airport').autocomplete({
    source: airports,
    minLength: 2,
    select: function(e, ui) {
      e.preventDefault();
      var cityAirport = ui.item.value;
      var airport = cityAirport.match(/\(.{3}\)/);
      console.log(airport)
      airport = airport[0].slice(1,4);
      console.log(airport)
      $('#from-airport').val(airport)
    }
  });
}
