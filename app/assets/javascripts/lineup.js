function showLineup() {
  $('.current').removeClass('current').fadeOut().appendTo('.hidden');
  $('.lineup').addClass('current').appendTo('.show').hide().fadeIn();
}

function lineupBuilder() {
  var officialArtists = $('.official').find('li');
  _.each(officialArtists, function(artist) {
    console.log(artist);
    $(artist).draggable();
  })
  $('.own').droppable({
    drop: function(e, dropped) {
      console.log(dropped);
      var index = officialArtists.indexOf($(dropped));
      officialArtists.remove(index);
      $(dropped).appendTo($('.own'));
    }
  });
}

$(document).ready(function() {
  lineupBuilder();
});
