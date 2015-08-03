RaveRepeat.Routers.Artists = Backbone.Router.extend({

  initialize: function() {
  	var current = {
      el: $('.lineup ul.own'),
      url: '/trips/'+tripId+'/lineup'
  	},
    official = {
      el: $('.lineup ul.official'),
      url: '/festivals/'+festivalId
  	};

  	currentLineup = this.fetchLineup(current.el, current.url);
  	officialLineup = this.fetchLineup(official.el, official.url);

    $('.lineup.continue-btn').click(this.saveLineup);
  },

  fetchLineup: function(el, url) {
  	var artists = new RaveRepeat.Collections.Artists(),
        lineup = new RaveRepeat.Views.ArtistsView({
          el: el,
          collection: artists
        });

  	artists.url = url;
  	artists.fetch({ async: false });
    return lineup;
  },

  saveLineup: function() {
     
  }

});
