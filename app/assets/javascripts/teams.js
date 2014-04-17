$(document).ready(function(){
  $('a.delete-team-pod').on('click', deleteTeamPod);
  $('#all-teams > div.stat-bar').on('click', toggleAllTeamsPanel)
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

function toggleAllTeamsPanel() {
  // alert("This works!");
  $('.team-list-panel').slideToggle(300, function(){
    var symbl = $('.plus-minus');
    var s = symbl.text()
    s == '-' ? $( symbl ).text('+') : $( symbl ).text('-')
  })
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
          console.log(result);
          pod.fadeOut(100);
        },
        error: function(e) {

        }
      });
      // do something
      console.log('yes...delete')
    }
    else {
      console.log("no dont delete");
      return
    }
  });



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

