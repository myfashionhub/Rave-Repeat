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

function toggleSection(section) {
  $('.current').removeClass('current').fadeOut().appendTo('.hidden');
  $(section).addClass('current').appendTo('.show').hide().fadeIn();
}

$(function() {
  raverNav();
  tripNav();
});
