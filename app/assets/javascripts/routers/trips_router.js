RaveRepeat.Routers.Trips = Backbone.Router.extend({
  routes: {

  },

  initialize: function() {
    var raver_id = $('.raver').attr('data-id');
    var pastTrips, upcomingTrips,
        pastTripsView, upcomingTripsView;

    this.showTrips(
      raver_id, '.trips div.upcoming', 'upcoming=true',
      upcomingTrips, upcomingTripsView);

    this.showTrips(
      raver_id, '.trips div.past', 'past=true',
      pastTrips, pastTripsView
    );
  },

  showTrips: function(raver_id, el, params, collection, listView) {
    this.collection = new RaveRepeat.Collections.Trips();
    this.listView = new RaveRepeat.Views.TripsView({
      collection: this.collection,
      el: $(el)
    });

    this.collection.url = '/ravers/'+raver_id+'/trips?'+params;
    this.collection.fetch({async: false});
  },

  menuNav: function() {
    _.extend($('.trip-menu a'), Backbone.Events);
    _.extend($('#save-lineup'), Backbone.Events);
  }

});
