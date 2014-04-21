$(document).ready(function(){
  $('.not-yet-implemented').on('click', notYetImplemented)

  var theForm = document.getElementById( 'theForm' );

  new stepsForm( theForm, {
    onSubmit : function( form ) {
      classie.addClass( theForm.querySelector( '.simform-inner' ), 'hide' );
      var nextMsg = 'Now, Let\'s add the league divisions';
      $('#step1').text(nextMsg).hide().fadeIn(500)
      // var messageEl = theForm.querySelector( '.final-message' );
      // messageEl.innerHTML = 'Now, Let\'s add the league divisions';
      // classie.addClass( messageEl, 'show' );

      setTimeout(function(){
        form.submit()
      }, 2000)

    }
  });





});


function notYetImplemented() {
  alertify.alert("This feature has not been implemented yet!");
}