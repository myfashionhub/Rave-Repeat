function flightSearch() {
  var location1 = $('#from-airport').val();
  var location2 = $('#to-airport').val();
  var date1 = $('#depart-date').val();
  var date2 = $('#return-date').val();
  date1 = date1.slice(6, 11) + '-' + date1.slice(0,2) + '-' + date1.slice(3,5);
  date2 = date2.slice(6, 11) + '-' + date2.slice(0,2) + '-' + date2.slice(3,5);
  var googleKey = 'AIzaSyBFA3QnRcB-HKcCnCA_3dEjtAYln3zGXBU'

  var requestBody = { 'request': {
    'passengers': {
      "kind": "qpxexpress#passengerCounts",
      "adultCount": 1
    },
    'slice': [
      {
        "kind": "qpxexpress#sliceInput",
        "origin": location1,
        "destination": location2,
        "date": date1,
        "maxStops": 0
      },
      {
        "kind": "qpxexpress#sliceInput",
        "origin": location2,
        "destination": location1,
        "date": date2,
        "maxStops": 0,
      }
    ],
    'solutions': 10
    }
  }

  $.ajax({
    url: 'https://www.googleapis.com/qpxExpress/v1/trips/search?key='+googleKey,
    method: 'post',
    dataType: 'json',
    contentType: 'application/json',
    data: JSON.stringify(requestBody),
    success: function(data) {
      displaySearchResult(data); }
  });

}

function displaySearchResult(data) {
  var results = data.trips.tripOption;
  console.log(results);

  var carrier = data.trips.data.carrier[0].name;

  _.each(results, function(trip) {
    var price = trip.saleTotal;
    var leg1  = trip.slice[0].segment[0];
    var carrier1 = leg1.flight.carrier;
    var origin1 = leg1.leg[0].origin;
    var destination1 = leg1.leg[0].destination;
    var depart1 = leg1.leg[0].departureTime;
    var arrival1 = leg1.leg[0].arrivalTime;

    var leg2 = trip.slice[1].segment[0];
    var carrier2 = leg2.flight.carrier;
    var origin2 = leg2.leg[0].origin;
    var destination2 = leg2.leg[0].destination;
    var depart2 = leg2.leg[0].departureTime;
    var arrival2 = leg2.leg[0].arrivalTime;
    console.log(price);
    console.log('Depart: ' + carrier1 + ' ' + origin1 + ' ' + destination1 + ' ' + depart1 + ' ' + arrival1);
    console.log('Return: ' + carrier2 + ' ' + origin2 + ' ' + destination2 + ' ' + depart2 + ' ' + arrival2);
  });

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
