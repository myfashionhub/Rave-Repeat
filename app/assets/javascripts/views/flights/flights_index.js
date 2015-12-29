RaveRepeat.Views.FlightView = Backbone.View.extend({
  tagName: 'article class="flight"',
  template: JST['flights/index'],
  events: {
    'click .save-flight': 'saveFlight',
    'click [class="delete-flight"]': 'delete'
  },

  initialize: function() {
    this.listenTo(this.model, 'all', this.render);
  },

  render: function() {
    var flight = this.template(this.model.attributes);
    this.$el.append(flight);
    return this;
  },

  delete: function() {
    this.model.destroy({url: '/flights/'+this.model.id,
      success: function(model, response) {
        notify(response.msg, 'success')
      },
      error: function(model, response) {
        notify(response, 'error')
      }
    });

    this.remove();
  },

  saveFlight: function() {
    this.model.save(null, {
      success: function(model, response) {
        $('.flight.continue-btn').trigger('click');
      },
      error: function(model, response) {
        notify(response, 'error')
      }
    });
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
  }

});
