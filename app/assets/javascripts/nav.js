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
