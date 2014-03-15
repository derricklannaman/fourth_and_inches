// TODO: Set page guard
$(document).ready(function() {

  $('#create_team_button').on('click', buildNewTeam);

});

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

      var team_outline = $('<div id="team_template"><strong>'+ title +'</strong></div>')
      $("#created_team").append(team_outline);
      var t = document.getElementById('team_template');
      for (var i = 0; i < players.length; i++) {
        var id = players[i].id
        var p = $('<div '+ id +' class="playerShell" ></div>');
        $(t).append(p)
      };
     },
    error: function(e) {
      console.log(e)
    }
  });
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



