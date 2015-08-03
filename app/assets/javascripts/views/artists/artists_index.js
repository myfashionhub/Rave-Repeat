RaveRepeat.Views.ArtistView = Backbone.View.extend({
  tagName: 'li class="artist"',
  template: JST['artists/index'],

  initialize: function() {
    //this.listenTo(this.model, 'all', this.render);
  },

  render: function() {
    var artist = this.template(this.model);
    this.$el.append(artist);
    return this;
  }

});


RaveRepeat.Views.ArtistsView = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.collection, 'all', this.render);
  },

  events: {
    'click .fa-times': 'removeArtist',
    'click .fa-plus': 'addArtist'
  },

  render: function() {
    var that = this;
    this.$el.empty();
    this.artists = this.collection.models[0].attributes.lineup;

    _.each(this.artists, function(artist) {
      var artistView = new RaveRepeat.Views.ArtistView({ 
        model: { 
          name: artist,
          id: that.artists.indexOf(artist) 
        }
      });
      that.$el.append(artistView.render().el)
    });
  },

  removeArtist: function(e) {
    var index = $(e.target).parent().find('.name').attr('data-id');
    this.artists.splice(index, 1);
    this.render();
  },

  addArtist: function(e) {
    // Clone artist from official lineup to current one  
    var index = $(e.target).parent().find('.name').attr('data-id');
        artist = officialLineup.artists[parseInt(index)];
    
    if (currentLineup.artists.indexOf(artist) === -1) {
      currentLineup.artists.unshift(artist);
      currentLineup.render();      
    } else {
      notify(artist+' is already in your lineup', 'error');
    }
  }

});
