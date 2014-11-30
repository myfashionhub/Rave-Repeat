function tripNav() {
  $('.trip-menu li').click(function(e) {
    var tabName = $(e.target).attr('class');
    var sectionName = tabName.replace('-tab', '');
    toggleTab(tabName);
    toggleSection(sectionName);
  });
}

function raverNav() {
  var currentTab = $.trim($('.current-tab').attr('class').replace('current-tab', ''));
  if (currentTab === 'current-raves') {
    $('.new-trip').hide();
  } else {
    $('.trips').hide();
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

function toggleTab(clickedTab) {
  $('.current-tab').removeClass('current-tab');
  $('.'+clickedTab).addClass('current-tab');
}

function toggleSection(section) {
  $('.current').removeClass('current').fadeOut().appendTo('.hidden');
  $('.'+section).addClass('current').appendTo('.show').hide().fadeIn();
}

function tripFlow() {
  $('#save-flight').click(function() {
    saveFlight();
    toggleTab('hotel-tab');
    toggleSection('hotel');
  });

  $('#save-hotel').click(function() {
    toggleTab('lineup-tab');
    toggleSection('lineup');
  });

  $('#save-lineup').click(function() {
    saveLineup();
    toggleTab('itinerary-tab');
  });
}
