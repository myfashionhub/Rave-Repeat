function saveLineup() {
  var artistList = $('.own').find('li');
  var artists    = [];
  _.each(artistList, function(artistLi) {
    $(artistLi).find('i').remove();
    artists.push($(artistLi).html());
  })

  $.ajax({
    url: '/trips/lineup',
    method: 'post',
    dataType: 'json',
    data: { trip_id: tripId, lineup: artists },
    success: function() { }
  });
}
