$(document).ready(function(){
  $( '#tp-grid' ).stapel({});
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


