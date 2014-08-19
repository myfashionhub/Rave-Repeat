//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require underscore
//= require backbone
//= require backboneApp
//= require_tree ../templates
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views
//= require_tree ./routers
//= require_tree .

$(document).ready(function() {
  if (window.location.hash && window.location.hash == '#_=_') {
      window.location.hash = '';
  }

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

  renderFlights();

  // Festival index
  renderRavers();
});
