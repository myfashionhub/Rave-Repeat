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
  },

  delete: function() {
    this.model.destroy();
    this.remove();
  },

  events: {
    'click [class="delete-flight"]': 'delete'
  }
});


RaveRepeat.Views.FlightsView = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.collection, 'all', this.render);
  },

  render: function() {
    var that = this;
    that.$el.empty();
    _.each(this.collection.models, function(flight) {
      var flightView = new RaveRepeat.Views.FlightView({model: flight});
      that.$el.append(flightView.render().el)
    });
  }

});
