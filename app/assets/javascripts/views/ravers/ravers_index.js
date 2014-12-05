RaveRepeat.Views.RaverView = Backbone.View.extend({
  tagName: 'li',
  template: JST['ravers/index'],

  initialize: function() {
    this.listenTo(this.model, 'all', this.render);
  },

  render: function() {
    var raver = this.template(this.model.attributes);
    this.$el.append(raver);
    return this;
  }
});


RaveRepeat.Views.RaversView = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.collection, 'all', this.render);
  },
  render: function() {
    var that = this;
    this.$el.empty();
    _.each(this.collection.models, function(raver) {
      var raverView = new RaveRepeat.Views.RaverView({model: raver});
      that.$el.append(raverView.render().el).hide().slideDown();
    });
  }

});
