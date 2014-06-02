$(document).ready(function(){
  $('#general_sign_up_form').hide();
  $('#carousel-example-generic').carousel({
    pause: true,
    interval: false
  });

  /////////// for avgrund modal
  $('a.general_user_sign_up_btn').avgrund({
      onLoad: function (elem) { $('#general_sign_up_form').show();},
      onBlurContainer: '.app-container',
      template: $('form#general_sign_up_form'),
      width: 456,
      height: 336,
  });


});




