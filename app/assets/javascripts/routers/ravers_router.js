

function renderRavers() {
  _.extend($('sup'), Backbone.Events);
  $('.festival-wrapper sup').click(function(e) {
    var sup         = $(e.target);
    var festival_id = sup.attr('data');
    var div         = sup.parent().parent().find('.ravers');
    $('.ravers').slideUp();
    RaveRepeat.showRavers(festival_id, div);
  });
}
