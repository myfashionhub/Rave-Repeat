function searchFlight() {
  var location1 = $('#from-airport').val().replace(' ', '%20');
  var location2 = $('#to-airport').val().replace(' ', '%20');
  var date1 = $('#depart-date').val().replace('/', '%2F');
  var date2 = $('#return-date').val().replace('/', '%2F');
  var base_url = 'http://www.kayak.com/s/search/air?';
  var query    = 'l1='+location1+'&l2='+location2+'&df=mdy&d1='+date1+'&d2='+date2+'&ns=y';
  window.open(base_url+query);
}

function viewFlights() {
  var url = $('.result-url').val();
  $.ajax({
    url: '/flights',
    method: 'post',
    data: { url: url },
    dataType: 'json',
    success: function(data) { console.log(data); }
  });
}


$(document).ready(function() {
  $('#search-flight').click(searchFlight);
  $('.view-flights').submit(function(e) {
    e.preventDefault();
    viewFlights();
  });
});


