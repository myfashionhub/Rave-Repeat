RaveRepeat.Collections.Flights = Backbone.Collection.extend({
  model: RaveRepeat.Models.Flight,
  url: '/flights/:id'
})

