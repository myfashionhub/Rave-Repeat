function navCurrent() {
  var tabs = $('menu-trip').find('li');
  _.each(tabs, function(tab) {
    $(tab).click(function() {
      $(tab).addClass('current-tab');
    })
  })
}

function newTripForm() {

}

$(function() {
  $('new-rave').click(newTripForm);
});
