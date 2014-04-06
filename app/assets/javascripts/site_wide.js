$(function(){
  $('#notice').delay(3000).fadeOut(3000);

  $('.player-action-sublist, .team-action-sublist').hide();
  $('#side-panel-list > li:nth-child(5)').hide() // player button
  $('#player-button').on('click', showPlayerOptions);
  // $('a.bt-menu-trigger').on('click', moveMainContentWithNav);
  $('a.btn-menu-trigger').on('click', moveHelpLogoUp);

  $(document).on('ajaxify:content_loaded', function() {
    var path = document.location.pathname;
    console.log(path)
    $('#bt-menu').removeClass('bt-menu-open').addClass('bt-menu-close');

    if ( path == '/team_manager' ) {
      setTimeout(function(){
        $('.team-action-sublist').show();
        $('#side-panel-list > li:nth-child(5)').show();
        $('.player-action-sublist').addClass('no-display');
      }, 10)

    }
    else if ( path == '/dashboard' ) {
      hideTeamNavigationOptions();
    }
    else if ( path == '/office_manager' ) {
      hideTeamNavigationOptions();
    }
    else if ( path == '/schedule_manager' ) {
      hideTeamNavigationOptions();
    }
    else if ( path == '/coaches_corner' ) {
      hideTeamNavigationOptions();
    }
    else if ( path == '/players' ) {
      hideTeamNavigationOptions();
      $('.player-delete').on('click', deletePlayer);

    }
    else if ( path == '/players/new' ) {
      hideTeamNavigationOptions();
    }
  });
});

// function moveMainContentWithNav() {
//   var content = $('div#main');
//   var isOpen = 'is-open';
//   if ( $(content).hasClass(isOpen) ){
//     content.animate({
//       marginLeft: "-=160",
//     }, 300, function() {
//       content.removeClass(isOpen);
//     });
//   }
//   else {
//     content.animate({
//       marginLeft: "+=160",
//     }, 300, function() {
//       content.addClass(isOpen);
//     });
//   }
// }

function moveHelpLogoUp() {
  var getHelpFlag = $('#get-help-flag');
  var isOpen = 'is-open';
  if ( $(getHelpFlag).hasClass(isOpen) ){
    getHelpFlag.animate({
      marginTop: "+=30",
    }, 250, function() {
      getHelpFlag.removeClass(isOpen)
    });
  }
  else {
    getHelpFlag.animate({
      marginTop: "-=30",
    }, 250, function() {
      getHelpFlag.addClass(isOpen)
    });
  }
}

function hideTeamNavigationOptions() {
  $('.player-action-sublist, .team-action-sublist').hide();
  $('#side-panel-list > li:nth-child(5)').hide();
}

function showTeamOptions() {
  $('.team-action-sublist').slideToggle(300)
}

function showPlayerOptions() {
  $('.player-action-sublist').removeClass('no-display').slideToggle(150)
}

