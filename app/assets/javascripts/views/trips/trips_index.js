RaveRepeat.Views.TripIndex = Backbone.View.extend({
  tagName: 'article',
  template: JST['trips/index'],
  initialize: function() {
    this.listenTo(this.model, 'all', this.render);
  },
  render: function() {
    var trip = this.template(this.model.attributes);
    this.$el.append(trip);
    return this;
  },
  delete: function() {
    console.log(this.model.url());
    this.model.destroy();
    this.remove();
  },
  events: {
    'click [class="delete-trip"]': 'delete'
  }
});

RaveRepeat.Views.TripsIndex = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.collection, 'all', this.render);
  },
  render: function() {
    var that = this;
    this.$el.empty();
    _.each(this.collection.models, function(trip) {
      var tripView = new RaveRepeat.Views.TripIndex({model: trip});
      that.$el.append(tripView.render().el);
    });
    return this;
  }
});

