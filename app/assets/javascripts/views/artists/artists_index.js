RaveRepeat.Views.ArtistView = Backbone.View.extend({
  tagName: 'li class="artist"',
  template: JST['artists/index'],

  initialize: function() {
    //this.listenTo(this.model, 'all', this.render);
  },

  render: function() {
    var artistLi = this.template(this.model);
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

    _.each(this.collection.models, function(artist) {
      artist.id = that.collection.indexOf(artist);

      var artistView = new RaveRepeat.Views.ArtistView({ 
        model: artist
      });

      that.$el.append(artistView.render().el)
    });
  },

  removeArtist: function(e) {
    var index = $(e.target).parent().find('.name').attr('data-id');
    this.collection.models.splice(index, 1);
    this.render();
  },

  addArtist: function(e) {
    // Clone artist from official lineup to current one
    var index = $(e.target).parent().find('.name').attr('data-id');
        artist = this.collection.models[parseInt(index)];
    
    if (currentLineup.collection.models.indexOf(artist) === -1) {
      currentLineup.collection.models.unshift(artist);
      currentLineup.render();      
    } else {
      notify(artist.name+' is already in your lineup', 'error');
    }
  }

});
