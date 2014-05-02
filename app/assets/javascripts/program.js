$(document).ready(function(){
  $('.not-yet-implemented').on('click', notYetImplemented);
  $('div#add-division').on('click', runStepsForm);
  $('div.spinner').hide();
  if (document.location.pathname == '/programs/new' ||
      document.location.pathname == '/divisions/new' ) {
      runStepsForm();
  }

});

function change_alertify_buttons() {
  // setTimeout(function(){
  //   var a = document.getElementById('alertify');
  //   var y = $(a).find('button#alertify-ok').text('Yes, Add Another Division');
  //   var n = $(a).find('button#alertify-cancel').text('Finished');
  // }, 0)
}


function runStepsForm() {
  var theForm = document.getElementById( 'theForm' );
  new stepsForm( theForm, {
    onSubmit : function( form ) {
      change_alertify_buttons();

      var fv = $('#form_name')[0].value;
      if (fv === 'add-division') {
        alertify.confirm("Add another division?", function(e) {
          if (e) {
            classie.addClass( theForm.querySelector( '.simform-inner' ), 'hide' );
            var addAnother = 'Adding another division';
            $('#step2').text(addAnother).hide().fadeIn(500);
            setTimeout(function(){
              var fv = $('#form_name')[0].value = "add more"
              form.submit()
            }, 300)
          }
          else {
            classie.addClass( theForm.querySelector( '.simform-inner' ), 'hide' );
            var nextMsg = 'Now, Let\'s add the league divisions';
            setTimeout(function(){
              form.submit()
            }, 300)
          }
        });
      }
      else if (fv === 'add-program'){
        classie.addClass( theForm.querySelector( '.simform-inner' ), 'hide' );
        var nextMsg = 'Now, Let\'s add the league divisions';
        // TODO: get better spinner
        $('div.spinner').show();
        $('#step1').text(nextMsg).hide().fadeIn(500);
        setTimeout(function(){
          form.submit()
        }, 2000)
      }
    }
  });
}

function notYetImplemented() {
  alertify.alert("This feature has not been implemented yet!");
}