RaveRepeat.Views.ArtistView = Backbone.View.extend({
  tagName: 'li class="artist"',
  template: JST['artists/index'],

  initialize: function() {
    //this.listenTo(this.model, 'all', this.render);
  },

  render: function() {
    var artistLi = this.template(this.model.attributes);
    this.$el.append(artistLi);
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

    if ( this.collection.models.length === 0 ) {
      this.$el.html('<p class="empty">No artist in your lineup</p>');
      return;
    }

    _.each(this.collection.models, function(artist) {
      artist.id = that.collection.indexOf(artist);

      var artistView = new RaveRepeat.Views.ArtistView({ 
        model: artist
      });

      that.$el.append(artistView.render().el)
    });
  },

  removeArtist: function(e) {
    var artistId = $(e.target).parent().find('.name').attr('data-id');

    var artist = this.collection.where({ id: parseInt(artistId) });
    this.collection.remove(artist);
    this.render();
  },

  addArtist: function(e) {
    // Clone artist from official lineup to current one
    var artistId = $(e.target).parent().find('.name').attr('data-id');
    var artist = this.collection.where({ id: parseInt(artistId) });

    if (currentLineup.collection.models.indexOf(artist) === -1) {
      currentLineup.collection.add(artist);
      currentLineup.render();      
    } else {
      notify(artist.attributes.name+' is already in your lineup', 'error');
    }
  }

});
