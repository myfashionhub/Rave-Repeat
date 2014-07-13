function showLineup() {
  $('.current').removeClass('current').fadeOut().appendTo('.hidden');
  $('.lineup').addClass('current').appendTo('.show').hide().fadeIn();
}

function lineupBuilder() {
  var officialArtists = $('.official').find('li');
  _.each(officialArtists, function(artist) {
    $(artist).draggable({
      cursor: 'move',
      helper: 'clone'
    });
  });

  $('.own').droppable({
    drop: function(e, dropped) {
      $(dropped.draggable).appendTo($('.own'));
    }
  });
}

function saveLineup() {
  var trip_id    = $('#trip-id').val();
  var artistList = $('.own').find('li');
  var artists    = [];
  _.each(artistList, function(artistLi) {
    artists.push($(artistLi).html());
  })

  $.ajax({
    url: '/trips/lineup',
    method: 'post',
    dataType: 'json',
    data: { trip_id: trip_id, lineup: artists },
    success: function() { console.log("Updated lineup"); }
  })
}

$(document).ready(function() {
  lineupBuilder();
  $('#save-lineup').click(saveLineup);
});
