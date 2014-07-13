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
      $(dropped.draggable).append(' <i class="fa fa-times"></i>');
      $(dropped.draggable).appendTo($('.own'));
      $('i').click(function(e) {
        modifyLineup(e);
      });
    }
  });
}

function saveLineup() {
  var tripId    = $('#trip-id').val();
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
    success: showItinerary
  })
}

function modifyLineup(e) {
  var artistLi = $(e.target).parent();
  artistLi.find('i').remove();
  $('.official').append(artistLi);
}
