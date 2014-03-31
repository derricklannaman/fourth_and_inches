// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){

  $('#new-team-side-link').on('click', showNewTeamForm)
  $('#createTeamButton').on('click', createNewTeam)

  $('a[disabled=disabled]').click(function(event){
      event.preventDefault(); // Prevent link from following its href
  });

});

function createNewTeam() {
  var f = $('#new-team-form')[0];
  var title = $(f).find('#team_title')[0].value;
  var age = $(f).find('#team_age_group')[0].value;
  var num = $(f).find('#team_num_of_players')[0].value;
  var formData = {
    title:  title,
    age:    age,
    num:    num,
  }
  $.ajax({
    type: 'POST',
    url: '/teams',
    data: { team: formData },
    success: function(result) {
      $(f).hide()

      var teamShell = result.team_info;
      var c = teamShell.name.toUpperCase();
      var h = " Football Team : ";
      var g = teamShell.group;
      $('section#current_team h3').text(c+h+g);

      changeCurrentPlayerCount(teamShell);
    },
    error: function(e) {
      alert("Sorry, something when wrong...");
    }
  });
}

function changeCurrentPlayerCount(teamShell) {
  var x = $('section#current_team p')[0];
  var str = $(x).text()
                .trim()
                .split(' ');
  str[str.length-1] = teamShell.num;
  var new_num = str.join(' ');
  $(x).text(new_num);
}


function showNewTeamForm() {
  console.log('showNewTeamForm');
}
