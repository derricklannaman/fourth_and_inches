$(document).ready(function(){
  $('form#logo-form').hide();
  $('.not-yet-implemented').on('click', notYetImplemented);
  $('div#add-division').on('click', runStepsForm);
  $('div.spinner').add('#fee-form').hide();
  $('#program-fee-button').on('click', showFeeForm)
  $('a#submit-program-fee').on('click',updateProgramFee)
  $('#add-logo-button').on('click', showLogoForm);

  // Add 3D-ism
  $('#logo-place-holder, .calendar').hover(function(){
    $('#logo-place-holder, .calendar').toggleClass('active')
  })
  // ========
  if (document.location.pathname == '/programs/new' ||
      document.location.pathname == '/divisions/new' ) {
      runStepsForm();
  }

});


function showLogoForm() {
  $('form#logo-form').fadeToggle(100);
}

function updateProgramFee() {
  var form = $('#program-fee-form');
      id = form.attr('action').split('/')[2];
      feeForm = $('#program_fee');
      fee = feeForm.find('option:selected')[0].value;

  $.ajax({
    type: 'Post',
    url: '/programs/set_fee',
    data: {id: id, fee: fee },
    success: function(result) {
      var newFee = result.fee
      $('#current-fee > span').text('$'+ newFee + '0' )
    },
    error: function(e) {
      console.log(e);
      whoopsErrorMessage();
    }
  });

}

function showFeeForm() {
  $('#fee-form').fadeToggle(100);
}

function change_alertify_buttons() {
  setTimeout(function(){
    var a = document.getElementById('alertify');
    var y = $(a).find('button#alertify-ok').text('Yes, Add Another Division');
    var n = $(a).find('button#alertify-cancel').text('Finished');
  }, 0)
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