RaveRepeat.Collections.Flights = Backbone.Collection.extend({
  model: RaveRepeat.Models.Flight,
  url: '/trips/:trip_id/flights'
})

