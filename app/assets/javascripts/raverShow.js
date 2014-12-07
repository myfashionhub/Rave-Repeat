if ($('.trips .upcoming').children().html() === '') {
  $('.trips').append('You currently don\'t have any trip planned.');
}

setTimeout(function() {
  _.each($('.trips div.past'), function(pastTrip) {
    var details = $(pastTrip).find('.details');
    var actions = $(pastTrip).find('.actions');
    actions.appendTo(details);
  });

  raverNav();
}, 200);

