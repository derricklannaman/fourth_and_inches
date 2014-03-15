// TODO: Set page guard
$(document).ready(function() {
  $('#new_team_form').hide();
  $('#newTeamButton').on('click', showNewTeamForm);
  $('#create_team_button').on('click', buildNewTeam);

});

function showNewTeamForm() {
  $('#new_team_form').toggle('show');
}

function buildNewTeam() {
  var teamInfo = package_team_info();

  $.ajax({
    type: "POST",
    url: "/teams/",
    dataType: "json",
    data: {
      team: teamInfo
    },
    success: function(result) {
      var team = result;
      var title = team.team_info.team_shell.title;
      var players = team.team_info.players_shell;

      var team_outline  = $('<div id="teamTemplate"></div>')
      var team_title    = $('<div><strong>'+ title +'</strong></div>')

      $("#created_team").prepend(team_outline);
      var t = document.getElementById('teamTemplate');
      team_title.insertBefore(t)
      for (var i = 0; i < players.length; i++) {
        var player = "player_";
        var id = players[i].id;
        var player_id = player + id;
        var p = $('<div id="'+ player_id +'" class="playerPlaceHolder"></div>');
        $(t).append(p);
      };
      var phs = $('.playerPlaceHolder');
      for (var i = 0; i < phs.length; i++) {
        phs[i].onclick = addPlayerDetails;
      };
     },
    error: function(e) {
      console.log(e)
    }
  });
}

function addPlayerDetails() {
  alert("player was clicked...add details!");
}


function package_team_info() {
  var els = $('form#create_new_team')[0].elements;
  var ageGroup = els[1].value;
  var playerNum = els[2].value;
  return {
    ag :ageGroup,
    pn :playerNum,
  }
}



