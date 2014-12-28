function tripNav() {
  $('.trip-menu .flight').addClass('current');
  $('.trip-wrapper section.flight').addClass('current');

  $('.trip-menu a').click(function(e) {
    var sectionName = $(e.target).attr('href').replace('#', ''),
        tabContainer = '.trip-menu',
        sectionContainer = '.trip-wrapper';
    toggleTab(tabContainer, sectionName);
    toggleSection(sectionContainer, sectionName);
  });
}

function raverNav() {
  $('.raver-wrapper section').hide();
  var currentTab = $.trim($('.current').attr('class').replace('current', ''));
  if (currentTab === 'current-raves') {
    $('.trips').fadeIn();
  } else {
    $('.new-trip').fadeIn();
  }

  $('nav.raver h3').click(function(e) {
    var tabName = $.trim($(e.target).attr('class').replace('current-tab', ''));
    toggleTab(tabName);
    if (tabName === 'current-raves') {
      $('.new-trip').hide();
      $('.trips').toggle('blind');
    } else {
      $('.trips').hide();
      $('.new-trip').toggle('blind');
    }
  });
}

function toggleTab(container, sectionName) {
  $(container+' .current').removeClass('current');
  $(container+' .'+sectionName).addClass('current');
}

function toggleSection(container, sectionName) {
  $(container+' section.current').fadeOut().removeClass('current');
  $(container+' section.'+sectionName).addClass('current').hide().fadeIn();
}

function tripFlow() {
  $('#save-flight').click(function() {
    $('.view-flights input').val('')
    $('.flight-results').empty();
    toggleTab('.trip-menu', 'hotel');
    toggleSection('.trip-wrapper', 'hotel');
  });

  $('#save-hotel').click(function() {
    toggleTab('.trip-menu', 'lineup');
    toggleSection('.trip-wrapper', 'lineup');
  });

  $('#save-lineup').click(function() {
    saveLineup();
    toggleTab('.trip-menu', 'itinerary');
    toggleSection('.trip-wrapper', 'itinerary');
  });
}

function notify(msg, status) {
  $('.notify .message').html(msg);
  if (status === 'success') {
    $('.notify').addClass('success');
  } else {
    $('.notify').addClass('error');
  }

  $('.notify').fadeIn();
  setTimeout(function() {
    $('.notify').fadeOut('slow');
    setTimeout(function() {
      $('.notify').removeClass('success').removeClass('error');
    }, 1000);
  }, 2000);
}
