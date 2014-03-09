// TODO: Set page guard
$(document).ready(function() {

  return $(".create_new_team").on("ajax:success", function(result) {
    var team = $('<div id="team_template"><strong>This is the new team</strong></div>')
    return $("#created_team").append(team);

  }).bind("ajax:error", function(e, error) {
    alert("Sorry something went wrong")
  });



});