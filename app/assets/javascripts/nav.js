function tripNav() {
  $('.flight-tab').click(function() {
    toggleTab('.flight-tab');
    toggleSection('.flight');
  });
  $('.hotel-tab').click(function() {
    toggleTab('.hotel-tab');
    toggleSection('.hotel');
  });
  $('.lineup-tab').click(function() {
    toggleTab('.lineup-tab');
    toggleSection('.lineup');
  });
  $('.itinerary-tab').click(function() {
    toggleTab('.itinerary-tab');
    toggleSection('.itinerary');
  });
}

function toggleTab(clickedTab) {
  $('.current-tab').removeClass('current-tab');
  $(clickedTab).addClass('current-tab');
}

function raverNav() {
  if ($('.current-trips').children().html() === '') {
    $('.current-trips').append('You currently don\'t have any trip planned.');
  }

  if ($('.current-tab').html() === 'Current raves') {
    $('.new-trip').hide();
    $('.current-trips').show();
  } else {
    $('.current-trips').hide();
    $('.new-trip').show();
  }

  $('.new-rave').click(function() {
    toggleTab('.new-rave');
    $('.current-trips').hide();
    $('.new-trip').toggle('blind');
  });

  $('.current-raves').click(function() {
    toggleTab('.current-raves');
    $('.new-trip').hide();
    $('.current-trips').toggle('blind');
  });
}

function toggleSection(section) {
  $('.current').removeClass('current').fadeOut().appendTo('.hidden');
  $(section).addClass('current').appendTo('.show').hide().fadeIn();
}

function tripFlow() {
  $('#save-flight').click(function() {
    saveFlight();
    toggleTab('.hotel-tab');
    toggleSection('.hotel');
  });

  $('#save-hotel').click(function() {
    toggleTab('.lineup-tab');
    toggleSection('.lineup');
  });

  $('#save-lineup').click(function() {
    saveLineup();
    toggleTab('.itinerary-tab');
  });
}
