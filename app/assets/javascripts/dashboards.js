// TODO: Set page guard
$(document).ready(function() {

  $('#create_team_button').on('click', buildNewTeam);

});

function buildNewTeam() {

  var els = $('form#create_new_team')[0].elements;
  var ageGroup = els[1].value;
  var playerNum = els[2].value;

  var initTeam = {
    ag :ageGroup,
    pn :playerNum,
  }

  $.ajax({
    type: "POST",
    url: "/teams/",
    dataType: "json",
    data: {
      team: initTeam
    },
    success: function(result) {
      var team = result;
      var team_outline = $('<div id="team_template"><strong>This is the new team</strong></div>')
      $("#created_team").append(team_outline);
     },
    error: function(e) {
      console.log(e)
    }
  });


}