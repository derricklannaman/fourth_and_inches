$(document).ready(function(){
  $('div.form-wrapper, #opponent-dropdown').hide();
  $('#entry-type-choice').change(changeForm);
  $('#add-practice, #add-game').on('click', toggleScheduleForm);
  $('#submit-schedule').on('click', addPracticeToCalendar);
  $('#schedule-picker').datepicker({ dateFormat: 'yy-mm-dd' });
  $('#schedule-time-picker').timepicker({ 'scrollDefaultNow': true });
});

function changeForm(evt) {
  var opt = $(this).find('option:selected')[0]
  var opt_type = $( opt ).text();
  var game_dropdown = $('#opponent-dropdown');
  if (opt_type === 'GAME') {
    game_dropdown.show();
  }
  else if (opt_type === 'PRACTICE') {
    game_dropdown.hide();
  }
  else {
    game_dropdown.hide();
  }
}

function addPracticeToCalendar() {
  var selections = $(this).closest('form').find('select');
      event_type = selections[0].value
      vs = selections[1].value
      inputs = $(this).closest('form').find('input');
      id   = inputs[2].value;
      date = inputs[3].value;
      time = inputs[4].value;

  var entry = {
    'id': id,
    'date': date,
    'time': time,
    'event_type': event_type,
    'vs': vs,
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
