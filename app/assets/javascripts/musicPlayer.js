function fetchPlaylist() {
  var festivalId = $('#festival-id').val();
  var playlistUrl, playlistId;
  $.ajax({
    url: '/festivals/'+festivalId,
    method: 'get',
    dataType: 'json',
    success: function(data) {
      var playlistUrl = data['playlist'];
      var playlistId  = data['playlist_scid'];
      playMusic(playlistUrl, playlistId);
    }
  });
}

function playMusic(playlistUrl, playlistId) {
  // var apiUrl = 'https://api.soundcloud.com/playlist/' + playlistId + '.json?client_id=fc46d58a55be79d17b031f6309ed02e6';
  // $.getJSON(apiUrl, function(data) {
  //   console.log(data);
  // });

  var startTrack = '6';
  var iframe  = $('.music-player');
  var baseUrl = "https://w.soundcloud.com/player/?url=";
  var params  = "&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&visual=false&start_track=";
  iframe.attr('src', baseUrl + playlistUrl + params + startTrack);
}


function widgetControl() {
  var iframe = document.querySelector('iframe');
  var widget = SC.Widget(iframe);

  $('.next').click(function() {
    widget.next();
  })
  $('.prev').click(function() {
    widget.prev();
  })
}
