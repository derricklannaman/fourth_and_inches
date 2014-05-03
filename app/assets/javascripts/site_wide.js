$(function(){
  fadeFlash();
  $('#home_jumbotron').hide();
  var path = document.location.pathname;
  if (path == '/') {
    $('#app-content').addClass('home-index-marquee');
    $('#home_jumbotron').delay(500).fadeIn(1000);
  }
  $('.player-action-sublist, .team-action-sublist').hide();
  $('#side-panel-list > li:nth-child(5)').hide() // player button
  $('#add-team-button').on('click', showTeamOptions);
  $('#team-side-panel-list > li').hover(addBottomHilight, removeBottomHilight);
  $('#player-button').on('click', showPlayerOptions);
  // $('a.btn-menu-trigger').on('click', moveHelpLogoUp);

  // $(document).on('ajaxify:content_loaded', function() {
    // var path = document.location.pathname;
    console.log(path)
    $('#bt-menu').removeClass('bt-menu-open').addClass('bt-menu-close');
    showPlayerOptions()
    selectSideNavBasedOnPath(path)

  // });

});

function addBottomHilight() {
  var option = $( this );
  // console.log(option);
    if ( option.hasClass('player-action-sublist') ) {
     option.addClass('bottom-hilight-reverse');
    }
    else {
        option.addClass('bottom-hilight');
    }
}

function removeBottomHilight() {
  var option = $( this );
    if ( option.hasClass('player-action-sublist') ) {
     option.removeClass('bottom-hilight-reverse');
    }
    else {
        option.removeClass('bottom-hilight');
    }
}

function selectSideNavBasedOnPath(path) {
  if ( path == '/team_manager' ) {
    $('#tm-player-button').on('click', showPlayerOptions);

    // $('.player-delete').on('click', deletePlayer);
    // run_stapel();
    setTimeout(function(){
      showTeamNavPanel();
      showPlayerOptions();
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
}

function showTeamNavPanel() {
  $('.team-action-sublist').show().addClass('yes-display');
  $('#side-panel-list > li:nth-child(5)').show();
  $('.player-action-sublist').addClass('yes-display');
}

function moveHelpLogoUp() {
  var getHelpFlag = $('#get-help-flag');
  var isOpen = 'is-open';
  if ( $(getHelpFlag).hasClass(isOpen) ){
    getHelpFlag.animate({
      marginTop: "+=25",
    }, 250, function() {
      getHelpFlag.removeClass(isOpen)
    });
  }
  else {
    getHelpFlag.animate({
      marginTop: "-=25",
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

//////////////////////////////////////////////////////
//           Site Wide Utility functions           //
//////////////////////////////////////////////////*/

function fadeFlash() {
  // $('#notice').delay(3000).fadeOut(3000);
}

function whoopsErrorMessage() {
  alertify.alert('Whoops! Something went wrong. Sorry, we gotta fix that...')
}

