function Trip() {
  var that = this;
  var tabs = [ 'flight', 'hotel', 'lineup', 'itinerary' ];

  this.init = function() {
    if (!window.location.hash || window.location.hash == '#_=_') {
      this.currentTab = 'flight';
    } else {
      this.currentTab = window.location.hash.replace('#','');
    }
    this.navigate();

    $('.trip-wrapper .continue-btn').click(function() {
      that.nextTab();
    });

    $('.trip-menu a').click(function(e) {
      that.currentTab = $(e.target).attr('href').replace('#','');
      that.navigate();
    });
  };

  this.navigate = function() {
    toggleTab('.trip-menu', that.currentTab);
    toggleSection('.trip-wrapper', that.currentTab);
    window.location.hash = '#' + that.currentTab;

    if ( this.currentTab === 'itinerary' ) {
      var flightsRouter = new RaveRepeat.Routers.Flights();
      flightsRouter.showFlights();

      var artistsRouter = new RaveRepeat.Routers.Artists();
      artistsRouter.fetchLineup($('.lineup ul.own'),'/trips/'+tripId)
    }
  };

  this.nextTab = function() {
    var currentIdx = tabs.indexOf(that.currentTab);
    this.currentTab = tabs[currentIdx + 1];
    this.navigate();
  };

  this.update = function() {
    var fromAirport = $('#from-airport').val();
    var toAirport   = $('#to-airport').val();
    var startDate   = $('#depart-date').val();
    var endDate     = $('#return-date').val();

    $.ajax({
      url: '/trips/'+tripId,
      method: 'put',
      dataType: 'json',
      data: {
        from_airport: fromAirport,
        to_airport: toAirport,
        start_date: startDate,
        end_date: endDate
      },
      success: function(data) {
        console.log(data);
      }
    });
  };

  this.init();
}
