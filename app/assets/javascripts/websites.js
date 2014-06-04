$(document).ready(function(){
  $('div.inner-player-form > #search-players').hide();
  $('#player_registered').change(changePlayerRegistrationForm);
  $('.general_sign_up_form, #new_player').hide();
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



