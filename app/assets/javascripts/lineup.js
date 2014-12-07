function displayOwnLineup() {
  var ownArtists = $('.own').find('li');
  _.each(ownArtists, function(artistLi) {
    if ($(artistLi).find('i').length === 0 ) {
      $(artistLi).append(' <i class="fa fa-times"></i>');
    }
  });

  $('.own i').click(function(e) {
    $(e.target).parent().remove();
  });
}

function dragDropArtists() {
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

function lineupBuilder() {
  var officialArtists = $('.official').find('li');
  _.each(officialArtists, function(artist) {
    $(artist).append(' <i class="fa fa-plus"></i>');
  });

  $('.official i').click(function(e) {
    var artistLi = $(e.target).parent();
    if (isDupe(artistLi)) {
      console.log('dupe')
    } else {
      artistLi.find('i').replaceWith('<i class="fa fa-times"></i>');
      artistLi.appendTo($('.own'));
      $('.official i').click(modifyLineup);
    }
  });
}

function isDupe(artistOfficial) {
  var ownArtists = $('.own').find('li');
  for (var i = 0; i < ownArtists.length; i++) {
    var artistOwn = ownArtists[i];
    if ($(artistOwn).contents()[0].data === $(artistOfficial).contents()[0].data) {
      return true;
    }
  }
  return false;
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
  artistLi.append(' <i class="fa fa-plus"></i>').appendTo($('.official'));
}
