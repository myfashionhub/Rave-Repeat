RaveRepeat.Routers.Artists = Backbone.Router.extend({

  initialize: function() {
  	var that = this;
  	saveLineup();
  	this.showLineup();

  	$('.trip-menu .itinerary').click(that.showLineup);
  },

  showLineup: function() {
  	currentLineup();
  }

});
