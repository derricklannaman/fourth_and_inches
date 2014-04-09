$(document).ready(function(){
  // var close = $( '#close' );
  // var teamGrid = $( '#tp-grid' );
  // var stapel = teamGrid.stapel({
  //   onLoad : function() {
  //     // do something before
  //   },
  //   onAfterOpen : function( pileName ) {
  //     close.show();
  //   }
  // });

  // close.on( 'click', function() {
  //   close.hide();
  //   stapel.closePile();
  // } );
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

