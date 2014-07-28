function flightSearch() {
  // var location1 = $('#from-airport').val().replace(' ', '%20');
  // var location2 = $('#to-airport').val().replace(' ', '%20');
  // var date1 = $('#depart-date').val().replace('/', '%2F');
  // var date2 = $('#return-date').val().replace('/', '%2F');
  var location1 = 'LGA';
  var location2 = 'MIA';
  var date1 = '2014-08-05';
  var date2 = '2014-08-09';
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
      console.log(data); }
  })

}

function displaySearchResult(data) {

}
