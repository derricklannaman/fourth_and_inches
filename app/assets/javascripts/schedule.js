$(document).ready(function(){
  $('div.form-wrapper').hide();
  $('#add-practice, #add-game').on('click', toggleScheduleForm);
  $('.submit-schedule').on('click', addPracticeToCalendar);

});

function addPracticeToCalendar() {
  var form = $(this).closest('form');
  var type = form.find('input')[2].value
  var date = form.find('input')[3].value
  var time = form.find('input')[4].value

  var practice = {
    type: type,
    date: date,
    time: time
  }
  console.log(practice)
  // ajax call to schedule#create
}

function toggleScheduleForm() {
  $('div.form-wrapper').toggle(0, function(){
    var cal = $('#schedule-manager');
    cal.toggleClass('schedule-manager-buffer');
  });
}
