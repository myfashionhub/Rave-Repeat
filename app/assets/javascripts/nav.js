function navTrip() {
  var tabs = $('menu-trip').find('li');
  _.each(tabs, function(tab) {
    $(tab).click(function() {
      $(tab).addClass('current-tab');
    })
  })
}


function navRaver() {
  RaveRepeat.initialize();

  if ($('.current-trips').children().html() === '') {
    $('.current-trips').append('You currently don\'t have any trip planned.');
  }

  if ($('.raver').find('.selected').html() === 'Current raves') {
    $('.new-trip').hide();
    $('.current-trips').show();
  } else {
    $('.current-trips').hide();
    $('.new-trip').show();
  }

  $('.new-rave').click(function() {
    $('.raver').find('.selected').removeClass('selected');
    $('.new-rave').addClass('selected');
    $('.current-trips').hide();
    $('.new-trip').toggle('blind');
  });

  $('.current-raves').click(function() {
    $('.raver').find('.selected').removeClass('selected');
    $('.current-raves').addClass('selected');
    $('.new-trip').hide();
    $('.current-trips').toggle('blind');
  });
}

$(function() {
  navRaver();

  $('.flight-section').click(showFlight);
  $('.hotel-section').click(showHotel);
  $('.lineup-section').click(showLineup);
  $('.itinerary-section').click(showItinerary);
});
