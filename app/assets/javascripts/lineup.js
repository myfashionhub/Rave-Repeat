function displayOwnLineup() {
  var ownArtists = $('.own').find('li');
  _.each(ownArtists, function(artistLi) {
    if ($(artistLi).find('i').length === 0 ) {
      $(artistLi).append('<i class="fa fa-times"></i>');
    }
  });
  $('i').click(function(e) {
    $(e.target).parent().remove();
  });
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
      var artistLi = dropped.draggable;
      //if (notDupe(artistLi.html())) {
        $(artistLi).append('<i class="fa fa-times"></i>');
        $(artistLi).appendTo($('.own'));
        $('i').click(function(e) {
          modifyLineup(e);
        });
      //}
    }
  });
}

// not working
function notDupe(artist) {
  var ownArtists = $('.own').find('li');
  _.each(ownArtists, function(artistLi) {
    if ($(artistLi).html() === artist) {
      console.log('start comparing');
      console.log($(artistLi).html());
      return false;
    } else {
      return true;
    }
  });
}

function saveLineup() {
  var tripId     = $('#trip-info').attr('trip-data');
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
    success: function() { toggleSection('itinerary'); }
  })
}


function modifyLineup(e) {
  var artistLi = $(e.target).parent();
  artistLi.find('i').remove();
  $('.official').append(artistLi);
  lineupBuilder();
  // Make item draggable after being returned to the list
}
