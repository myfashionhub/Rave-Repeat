RaveRepeat.Views.TripView = Backbone.View.extend({
  tagName: 'article',
  template: JST['trips/index'],

  initialize: function() {
    this.listenTo(this.model, 'all', this.render);
  },

  events: {
    'click .delete-trip': 'confirmDelete',
    'click .expand': 'showTripDetails'
  },

  render: function() {
    var trip = this.template(this.model.attributes);
    this.$el.append(trip);
    return this;
  },

  confirmDelete: function() {
    var that = this;
    $('.overlay').show();
    $('.modal.delete-trip').show();
    _.extend($('.delete-trip .confirm'), Backbone.Events);
    _.extend($('.delete-trip .cancel'), Backbone.Events);
    _.extend($('.delete-trip .fa-times'), Backbone.Events);

    var closeModal = function() {
      $('.overlay').hide();
      $('.modal.delete-trip').hide();
    }

    $('.delete-trip .cancel').click(closeModal);
    $('.delete-trip .fa-times').click(closeModal);

    $('.delete-trip .confirm').click(function() {
      that.delete();
      closeModal();
    });
  },

  delete: function() {
    this.model.url = 'http://'+window.location.host+'/trips/'+this.model.id;
    this.model.destroy();
    this.remove();
  },

  showTripDetails: function() {
    var details = this.$el.find('.details')
    if (details.css('display') === 'none') {
      details.slideDown();
    } else {
      details.slideUp();
    }
  }
});

RaveRepeat.Views.TripsView = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.collection, 'all', this.render);
  },

  render: function() {
    var that = this;
    this.$el.empty();

    if (this.collection.models.length === 0) {
      that.$el.html('<p>No trip to show.</p>');
    } else {
      _.each(this.collection.models, function(trip) {
        var tripView = new RaveRepeat.Views.TripView({model: trip});
        that.$el.append(tripView.render().el);
      });
    }
    return this;
  }
});

