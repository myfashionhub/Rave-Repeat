RaveRepeat.Routers.Ravers = Backbone.Router.extend({
  routes: {

  },

  initialize: function() {
    var that = this;
    _.each($('.festival'), function(festival) {
      var id = $(festival).attr('data');
      var url = '/festivals/'+id;
      var el = $(festival).find('.ravers');
      that.fetchRavers(url, el);
    });

    this.toggleRavers();
  },

  fetchRavers: function(url, el) {
    var ravers = new RaveRepeat.Collections.Ravers();
    var raversView = new RaveRepeat.Views.RaversView({
      collection: ravers,
      el: el
    });

    ravers.url = url;
    ravers.fetch({async: false});
  },

  toggleRavers: function() {
    _.extend($('.festival sup'), Backbone.Events);

    $('.festival sup').click(function(e) {
      var ravers = $(this).parent().parent().find('.ravers');
      if (ravers.css('display') === 'none') {
        ravers.slideDown();
      } else {
        ravers.slideUp();
      }
    });
  }

});

