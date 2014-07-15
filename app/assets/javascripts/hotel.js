function showHotel() {
  $('.current').removeClass('current').fadeOut().appendTo('.hidden');
  $('.hotel').addClass('current').appendTo('.show').hide().fadeIn();
}
