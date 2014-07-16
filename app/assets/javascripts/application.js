//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require underscore
//= require backbone
//= require rave_repeat
//= require_tree ../templates
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views
//= require_tree ./routers
//= require_tree .

$(document).ready(function() {
  RaveRepeat.initialize();

  raverNav();
  tripNav();
  tripFlow();

  // Flight functions
  $('#search-flight').click(function(e) {
    e.preventDefault();
    updateTrip();
    searchFlight();
  });

  $('.view-flights').submit(function(e) {
    e.preventDefault();
    viewFlights();
  });

  // Line up functions
  displayOwnLineup();
  lineupBuilder();

});
