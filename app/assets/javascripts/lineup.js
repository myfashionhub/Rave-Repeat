function showLineup() {
  $('.current').removeClass('current').fadeOut().appendTo('.hidden');
  $('.lineup').addClass('current').appendTo('.show').hide().fadeIn();
}
