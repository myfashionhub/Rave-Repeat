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
    console.log(this.model.id)
    this.remove();
  },

  saveFlight: function() {
    var leg1 = this.$el.find('.leg1').html();
    var leg2 = this.$el.find('.leg2').html();
    var link    = this.$el.find('.buy').attr('href');
    var airline = this.$el.find('.airline').html();
    var price   = this.$el.find('.price').html();
    var tripId = $('#trip-info').attr('trip-data');

    var flight = new RaveRepeat.Models.Flight({
      leg1: leg1, leg2: leg2,
      price: price, airline: airline,
      link: link, trip_id: tripId
    });

    flight.save(null, {
      success: function(model, response) {
        notify(response.msg, 'success');
      },
      error: function(model, response) {
        notify(response, 'error')
      }
    });

    this.$el.find('.saved').show();
    this.$el.find('.save-flight').hide();
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
