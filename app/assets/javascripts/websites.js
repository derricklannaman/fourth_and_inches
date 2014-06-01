$(document).ready(function(){
  $('#general_sign_up_form').hide();
  $('#carousel-example-generic').carousel({
    pause: true,
    interval: false
  });

  /////////// for avgrund modal
  $('a.general_user_sign_up_btn').avgrund({
      onBlurContainer: '.app-container',
      template: $('form#general_sign_up_form'),
      width: 456,
      height: 336,
  });


  // $('a.general_user_sign_up_btn').on('click', show_sign_up_form);
  // $('a.general_user_sign_up_btn').avgrund();
});


function show_sign_up_form() {
  // $('#carousel-example-generic').toggleClass('add_sign-up-buffer')
  // $('#general_sign_up_form').slideToggle();
}


