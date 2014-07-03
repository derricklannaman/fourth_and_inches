$(document).ready(function(){
  $('div.inner-player-form > #search-players').hide();
  $('div.view-payment-details').hide();
  $('#view-payment-btn').on('click', showAccountDetails);
  $('#player_registered').change(changePlayerRegistrationForm);
  $('.general_sign_up_form, #website_channeled_player').hide();
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

  $('button.new-registr').avgrund({
      onLoad: function (elem) { $('form#website_channeled_player').show();},
      onBlurContainer: '.app-container',
      template: $('form#website_channeled_player'),
      width: 480,
      height: 420,
      holderClass: 'web-registered-player',
  });
  var availableTags = [
        "ActionScript",
        "AppleScript",
        "Asp",
        "BASIC",
        "C",
        "C++",
        "Clojure",
        "COBOL",
        "ColdFusion",
        "Erlang",
        "Fortran",
        "Groovy",
        "Haskell",
        "Java",
        "JavaScript",
        "Lisp",
        "Perl",
        "PHP",
        "Python",
        "Ruby",
        "Scala",
        "Scheme"
      ];


    $( "#tags" ).autocomplete({
      source: '/all_players'
    });

});

function showAccountDetails() {
  // $('div.view-payment-details').slideToggle(100);
  $('div.view-payment-details').toggle();
}


function changePlayerRegistrationForm() {
  var x = $( "input:checked" ).val();
  var newPlayerInputs = $('div.inner-player-form > #new-player');
  var searchForPlayer = $('div.inner-player-form > #search-players');
  if (x == 'false') {
    // $.ajax({
    //   type: 'GET',
    //   url: '/all_players',
    //   success: function(result) {
    //     console.log(result);
    //   },
    //   error: function(e) {
    //     console.log('Fail');
    //     console.log(e);
    //   }

    // });



    newPlayerInputs.hide();
    searchForPlayer.show();

  }
  else {
    searchForPlayer.hide();
    newPlayerInputs.show();
  }

}



