$(document).ready(function(){
  $('.not-yet-implemented').on('click', notYetImplemented)

  // if (document.location.pathname != '/teams/new') {
    var theForm = document.getElementById( 'theForm' );
    new stepsForm( theForm, {
      onSubmit : function( form ) {
        classie.addClass( theForm.querySelector( '.simform-inner' ), 'hide' );
        var nextMsg = 'Now, Let\'s add the league divisions';
        $('#step1').text(nextMsg).hide().fadeIn(500)
        setTimeout(function(){
          form.submit()
        }, 2000)
      }
    });
  // }

});

function notYetImplemented() {
  alertify.alert("This feature has not been implemented yet!");
}