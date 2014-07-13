//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require underscore
//= require backbone
//= require go_raver
//= require_tree ../templates
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views
//= require_tree ./routers
//= require_tree .

$(document).ready(function() {
  // Flight functions
  $('#search-flight').click(function() {
    searchFlight();
  });

  $('.view-flights').submit(function(e) {
    e.preventDefault();
    viewFlights();
  });

  $('#save-flight').click(saveFlight);

  // Line up functions
  lineupBuilder();
  $('#save-lineup').click(function() {
    saveLineup();
  });

  // Nav triggers
  $('.flight-section').click(function() {
    showFlight();
    console.log('I clicked');
  });
  $('.lineup-section').click(showLineup);
  $('.itinerary-section').click(showItinerary);
});
