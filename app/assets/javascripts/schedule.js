$(document).ready(function(){
  $('#add-practice, #add-game').on('click', addToCalendar);
  $('div.form-wrapper').hide();


});

function addToCalendar() {
  $('div.form-wrapper').toggle(0, function(){
    var cal = $('#schedule-manager');
    cal.toggleClass('schedule-manager-buffer');
  });
}
