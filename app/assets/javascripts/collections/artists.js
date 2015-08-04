RaveRepeat.Collections.Artists = Backbone.Collection.extend({
  model: RaveRepeat.Models.Artist,

  parse: function(response, options) {
    return response.lineup;
  }
})
