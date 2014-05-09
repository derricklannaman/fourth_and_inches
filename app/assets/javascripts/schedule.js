$(document).ready(function(){
  $('div.form-wrapper').hide();
  $('#add-practice, #add-game').on('click', toggleScheduleForm);
  $('.submit-schedule').on('click', addPracticeToCalendar);

});

function addPracticeToCalendar() {
  var event_type = $(this).closest('form').find('select')[0].value
  var inputs = $(this).closest('form').find('input');
  var id   = inputs[2].value;
  var date = inputs[3].value;
  var time = inputs[4].value;

  var entry = {
    'id': id,
    'date': date,
    'time': time,
    'event_type': event_type,
  }

  $.ajax({
    type: 'POST',
    url: '/schedules',
    data: { entry: entry },
    success: function(result) {
      console.log(result);
    },
    error: function(e) {
      console.log(e);
    }
  });



  // console.log(practice)
  // ajax call to schedule#create
}

function toggleScheduleForm() {
  $('div.form-wrapper').toggle(0, function(){
    var cal = $('#schedule-manager');
    cal.toggleClass('schedule-manager-buffer');
  });
}
