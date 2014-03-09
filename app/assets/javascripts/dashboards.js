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
      var team_outline = $('<div id="team_template"><strong>'+ team.title +'</strong></div>')
      $("#created_team").append(team_outline);
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



