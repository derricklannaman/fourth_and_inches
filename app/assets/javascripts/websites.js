$(document).ready(function(){
  $('.general_sign_up_form, #new_player').hide();
  // $('form#new_player').hide();
  $('#carousel-example-generic').carousel({
    pause: true,
    interval: false
  });

  /////////// for avgrund modal
  $('a.general_user_sign_up_btn').avgrund({
      onLoad: function (elem) { $('.general_sign_up_form').show();},
      onBlurContainer: '.app-container',
      template: $('form.general_sign_up_form'),
      width: 456,
      height: 336,
  });

  $('button#registr_btn').avgrund({
      onLoad: function (elem) { $('form#new_player').show();},
      onBlurContainer: '.app-container',
      template: $('form#new_player'),
      width: 480,
      height: 400,
  });



});




