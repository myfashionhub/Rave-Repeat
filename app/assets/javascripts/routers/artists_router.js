RaveRepeat.Routers.Artists = Backbone.Router.extend({

  initialize: function() {
  	var current = {
      el: $('.lineup ul.own'),
      url: '/trips/'+tripId
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
    var lineup = [];
    _.each(currentLineup.collection.models, function(artist) {
      lineup.push(artist.attributes.id);
    });

    $.ajax({
      url: '/trips/'+tripId,
      type: 'PUT',
      data: { lineup: lineup },
      success: function(data) {
        notify(data.msg, 'success')
      }
    })
  }

});
