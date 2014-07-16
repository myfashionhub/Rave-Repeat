RaveRepeat.Views.FlightView = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.model, 'all', this.render);
  },
  tagName: 'article',
  template: JST['flights/index'],
  render: function() {
    var flight = this.template(this.model.attributes);
    this.$el.append(flight);
    return this;
  }
});


RaveRepeat.Views.FlightsView = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.collection, 'all', this.render);
  },
  render: function() {
    var that = this;
    this.$el.empty();
    _.each(this.collection.models, function(flight) {
      var flightView = new RaveRepeat.Views.FlightView({model: flight});
      that.$el.append(flightView.render().el)
    });
  },

  showFlights: function() {
    var trip_id = $('#trip-id').val();
    var flights = new RaveRepeat.Collections.Flights();
    flights.url = '/trips/'+ trip_id + '/flights';

    var flightsView = new RaveRepeat.Views.FlightsView({
      collection: flights,
      el: $('.current-flight')
    });

    flights.fetch({
      success: flightsView.render
    });
  }

});
