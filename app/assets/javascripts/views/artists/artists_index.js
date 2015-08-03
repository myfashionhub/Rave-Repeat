RaveRepeat.Views.ArtistView = Backbone.View.extend({
  tagName: 'li class="artist"',
  template: JST['artists/index'],
  events: {
    'click .fa-times': 'remove',
    'click .fa-plus': 'add'
  },

  initialize: function() {
    //this.listenTo(this.model, 'all', this.render);
  },

  render: function() {
    var artist = this.template(this.model);
    this.$el.append(artist);
    return this;
  },

  remove: function() {
    this.remove();
  },

  add: function(collection) {
    collection.push(this.model)
  }
});


RaveRepeat.Views.ArtistsView = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.collection, 'all', this.render);
  },

  render: function() {
    var that = this;
    this.$el.empty();

    var artists = this.collection.models[0].attributes.lineup;
    _.each(artists, function(artist) {
      var artistView = new RaveRepeat.Views.ArtistView({ 
        model: { name: artist }
      });
      that.$el.append(artistView.render().el)
    });
  },

  save: function() {
    var artistList = $('.own').find('li');
    var artists    = [];
    _.each(artistList, function(artistLi) {
      $(artistLi).find('i').remove();
      artists.push($(artistLi).html());
    })  

    $.ajax({
      url: '/trips/lineup',
      method: 'post',
      dataType: 'json',
      data: { trip_id: tripId, lineup: artists },
      success: function() { }
    });    
  }

});
