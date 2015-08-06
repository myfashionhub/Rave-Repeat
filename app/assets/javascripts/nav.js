/* EDIT TRIP */
function tripNav() {
  $('.trip-menu a').click(function(e) {
    var sectionName = $(e.target).attr('href').replace('#', ''),
        tabContainer = '.trip-menu',
        sectionContainer = '.trip-wrapper';
    toggleTab(tabContainer, sectionName);
    toggleSection(sectionContainer, sectionName);
  });

  // Remove hash created by Facebook redirect
  if (window.location.hash && window.location.hash == '#_=_') {
      window.location.hash = '';
  }
}

function tripFlow() {
  $('.continue-btn').click(function() {
    var nextTab = $(this).attr('data-tab');
    toggleTab('.trip-menu', nextTab);
    toggleSection('.trip-wrapper', nextTab);

  });
}

function detectTripSection() {
  var sectionName = window.location.hash.replace('#','');
  if (sectionName === '') {
    sectionName = 'flight';
  }

  toggleTab('.trip-menu', sectionName);
  toggleSection('.trip-wrapper', sectionName);
}

/* RAVER NAV */
function raverNav() {
  $('.raver-wrapper section').hide();
  var currentTab = $.trim($('.current').attr('class').replace(' current', ''));
  if (currentTab === 'current-raves') {
    $('.trips').fadeIn();
  } else {
    $('.new-trip').fadeIn();
  }

  $('nav.raver h3').click(function(e) {
    var tabName = $.trim($(e.target).attr('class').replace(' current', ''));
    toggleTab('nav.raver', tabName);

    if (tabName === 'current-raves') {
      $('.new-trip').hide();
      $('.trips').toggle('blind');
    } else {
      $('.trips').hide();
      $('.new-trip').toggle('blind');
    }
  });
}

/* HELPER FUNCTIONS */
function toggleTab(container, sectionName) {
  $(container+' .current').removeClass('current');
  $(container+' .'+sectionName).addClass('current');
}

function toggleSection(container, sectionName) {
  $(container+' section.current').fadeOut().removeClass('current');
  $(container+' section.'+sectionName).addClass('current').hide().fadeIn();
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
