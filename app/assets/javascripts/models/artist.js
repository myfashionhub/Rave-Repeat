RaveRepeat.Models.Artist = Backbone.Model.extend({
  parse: function(response, options) {
    this.name = response;
  }
});
