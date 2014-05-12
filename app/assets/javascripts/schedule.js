$(document).ready(function(){
  $('div.form-wrapper').hide();
  $('#add-practice, #add-game').on('click', toggleScheduleForm);
  $('.submit-schedule').on('click', addPracticeToCalendar);
  $( "#schedule-picker" ).datepicker({
      dateFormat: 'yy-mm-dd'
        // minDate: getFormattedDate(new Date())
    });
});


function getFormattedDate(date){
    var day = date.getDate();
    var month = date.getMonth() + 1;
    var year = date.getFullYear().toString().slice(2);
    return day + '-' + month + '-' + year;
}


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
      $('#schedule-manager').removeClass('schedule-manager-buffer');
      $('div.form-wrapper').hide();
      location.reload();
    },
    error: function(e) {
      console.log(e);
    }
  });
}

function toggleScheduleForm() {
  $('div.form-wrapper').toggle(0, function(){
    var cal = $('#schedule-manager');
    cal.toggleClass('schedule-manager-buffer');
  });
}
