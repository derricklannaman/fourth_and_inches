// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){

  $('#coach-invite-form, #staff-invite-form').hide();
  $('#coach-invite-button').on('click', toggleCoachAccessForm)
  $('#staff-invite-button').on('click', toggleStaffAccessForm)
});

function toggleStaffAccessForm() {
  $('#staff-invite-form').slideToggle(100)
}


function toggleCoachAccessForm() {
  $('#coach-invite-form').slideToggle(100)
}