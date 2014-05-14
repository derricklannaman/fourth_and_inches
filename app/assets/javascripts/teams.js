$(document).ready(function(){
  $('a.delete-team-pod').on('click', deleteTeamPod);
  $('a.delete-division-pod').on('click', deleteDivision);
  $('a.delete-opponent-pod').on('click', deleteOpponent);
  $('#all-teams > div.stat-bar').on('click', toggleAllTeamsPanel)
  $('#all-divisions > div.stat-bar').on('click', toggleDivisionsPanel)
  run_stapel();
  $( 'a[disabled=disabled]' ).click(function(event){
      event.preventDefault(); // Prevent link from following its href
  });

  ///////////// for avgrund modal
  // $('#new-team-side-link').avgrund({
  //     onBlurContainer: '.app-container',
  //     template: $('section#addNewTeam'),
  //     width: 456,
  //     height: 336,
  // });
});

function toggleDivisionsPanel() {
  $('.division-list-panel').slideToggle(100, function(){
    var symbl = $('#plus-minus2');
    var s = symbl.text();
    s == '-' ? $( symbl ).text('+') : $( symbl ).text('-')
  })
}

function toggleAllTeamsPanel() {
  $('.team-list-panel').slideToggle(100, function(){
    var symbl = $('#plus-minus1');
    var s = symbl.text();
    s == '-' ? $( symbl ).text('+') : $( symbl ).text('-')
  })
}

function deleteOpponent() {
  var thisLink = $( this );
  var pod = thisLink.closest('div.opponent-pod');
  var id = thisLink.prev()
              .attr('href')
              .split('/')[2]

  $.ajax({
    type: 'POST',
    url: '/opponents/' + id + '/list_destroy',
    success: function(result){
      pod.fadeOut(100);
      fadeFlash();
    },
    error: function(e) {
      whoopsErrorMessage();
      console.log(e);
    }
  });
}

function deleteDivision() {
  var thisLink = $( this );
  var pod = thisLink.closest('div.division-pod');
  var id = thisLink.prev()
              .attr('href')
              .split('/')[2]

  $.ajax({
    type: 'DELETE',
    url: '/divisions/' + id,
    success: function(result){
      pod.fadeOut(100);
      fadeFlash();

    },
    error: function(e) {
      whoopsErrorMessage();
      console.log(e);
    }
  });
}

function deleteTeamPod() {
  var btn = $( this );
  var pod = btn.closest('.team_pod');
  var id = btn.prev()
              .attr('href')
              .split('/')[2]
  alertify.confirm("clicking OK will permanently delete this team", function(e) {
    if (e) {
      $.ajax({
        type: 'DELETE',
        url: '/teams/'+ id,
        success: function(result) {
          var msg = "<div id='notice'>Team successfully deleted</div>";
          $('#flash_messages').wrapInner(msg);
          updateTeamCount();
          pod.fadeOut(100);
          fadeFlash();
        },
        error: function(e) {
          whoopsErrorMessage();
        }
      });
    }
    else {
      return
    }
  });
}

function updateTeamCount() {
  var teamCounter = $('#team-counter');
  var oldCnt = teamCounter.text();
  var a = $.trim(oldCnt).split(' ');
  var n = a[a.length - 1];
  n--;
  a[a.length - 1] = n;
  var newCnt = a.join(" ");
  teamCounter.text(newCnt);
}

function run_stapel() {
  var close = $( '#close' );
  var teamGrid = $( '#tp-grid' );
  var stapel = teamGrid.stapel({
    onLoad : function() {
      // do something before
    },
    onAfterOpen : function( pileName ) {
      close.show();
    }
  });

  close.on( 'click', function() {
    close.hide();
    stapel.closePile();
  } );

}

