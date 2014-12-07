function updateTrip() {
  var fromAirport = $('#from-airport').val();
  var toAirport   = $('#to-airport').val();
  var startDate   = $('#depart-date').val();
  var endDate     = $('#return-date').val();
  var tripId      = $('#trip-info').attr('trip-data');
  startDate = startDate.split('/')[2]+'-'+startDate.split('/')[0]+'-'+startDate.split('/')[1];
  endDate = endDate.split('/')[2]+'-'+endDate.split('/')[0]+'-'+endDate.split('/')[1];

  $.ajax({
    url: '/trips/'+tripId,
    method: 'put',
    dataType: 'json',
    data: { from_airport: fromAirport, to_airport: toAirport, start_date: startDate, end_date: endDate },
    success: function() { console.log("Trip updated"); }
  });
}

function spreadPLUR() {
  $('#share').mouseenter(function() {

  });
}

function currentLineup() {
  var tripId = $('#trip-info').attr('trip-data');
  $.ajax({
    url: '/trips/'+tripId+'/lineup',
    method: 'get',
    dataType: 'json',
    success: function(data) {
      var artists = data.lineup;
      $('.current-lineup ul').empty();

      _.each(artists, function(artist) {
        var artistLi = $('<li>').html(artist);
        $('.current-lineup ul').append(artistLi);
      });
    }
  });
}
