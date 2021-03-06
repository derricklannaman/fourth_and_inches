$(function(){
  fadeFlash();
  var path = document.location.pathname;
  hideSignInOnPage(path);
  $('.player-action-sublist, .team-action-sublist').hide();
  $('#side-panel-list > li:nth-child(5)').hide() // player button
  $('#add-team-button').on('click', showTeamOptions);
  $('#team-side-panel-list > li').hover(addBottomHilight, removeBottomHilight);
  $('#player-button').on('click', showPlayerOptions);
  // $(document).on('ajaxify:content_loaded', function() {
    // var path = document.location.pathname;
    // public_page = ['/', '/about', '/faq', 'contact']
    // if( path != '/') {
    //   // $('.app-container').addClass('inner-app-padding');
    // }

    console.log(path)
    $('#bt-menu').removeClass('bt-menu-open').addClass('bt-menu-close');
    showPlayerOptions()
    selectSideNavBasedOnPath(path)

  // });




});

function hideSignInOnPage(path) {
  if(path == "/users/sign_in") {
    $('#home-sign-in-button').hide();
  }
}

function addBottomHilight() {
  var option = $( this );
  if ( option.hasClass('player-action-sublist' ) ||
       option.hasClass('team-action-sublist' ) ) {
            option.addClass('bottom-hilight-reverse');
  }
  else {
      option.addClass('bottom-hilight');
  }
}

function removeBottomHilight() {
  var option = $( this );
  if ( option.hasClass('player-action-sublist') || option.hasClass('team-action-sublist' ) ) {
            option.removeClass('bottom-hilight-reverse');
  }
  else {
      option.removeClass('bottom-hilight');
  }
}

function selectSideNavBasedOnPath(path) {
  if ( path == '/team_manager' ) {
    $('#tm-player-button').on('click', showPlayerOptions);
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

//////////////////////////////////////////////////////
//           Site Wide Utility functions           //
//////////////////////////////////////////////////*/

function fadeFlash() {
  $('#notice').delay(10000).slideUp(100);
}

function whoopsErrorMessage() {
  alertify.alert('Whoops! Something went wrong. Sorry, we gotta fix that...')
}

