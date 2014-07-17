RaveRepeat.Collections.Ravers = Backbone.Collection.extend({
  model: RaveRepeat.Models.Raver,
  url: '/festivals/:id'
})

