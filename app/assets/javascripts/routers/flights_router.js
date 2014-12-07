RaveRepeat.Routers.Flights = Backbone.Router.extend({
  routes: {

  },

  initialize: function() {
    this.viewSearchResults();
  },

  viewSearchResults: function() {
    var that = this;
    _.extend($('#view-flights'), Backbone.Events);
    _.extend($('.view-flights'), Backbone.Events);

    var viewResults = function(e) {
      e.preventDefault();
      console.log('Backbone view flights')
      var url = $('.result-url').val();
      var flights = new RaveRepeat.Collections.Flights();
      var flightsView = new RaveRepeat.Views.FlightsView({
        collection: flights,
        el: $('.flight-results')
      });
      flights.url = '/flights/search?url='+url
      flights.fetch({async: false,
        success: function() {},
        error: function() {
          that.$el.html('Cannot fetch flights at the moment.')
        }
      });
    };

    $('#view-flight').click(viewResults);
    $('.view-flights').submit(viewResults);
  }

});
