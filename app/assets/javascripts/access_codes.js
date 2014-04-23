// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){

  $('#coach-invite-form').hide();
  $('#coach-invite-button').on('click', toggleAccessForms )

});


function toggleAccessForms() {
  $('#coach-invite-form').slideToggle(100)
}