// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// TODO: Set page guard
$(document).ready(function() {
  $('section#viewAllTeams, section#addNewTeam').hide();
  $('#allTeamsButton').on('click', showAllTeams);
  $('#addNewTeamButton').on('click', showNewTeamForm);
  $('#cancelNewTeamForm, #createTeamButton').on('click', hideNewTeamForm);
  $('#closeAllTeamsView').on('click', hideAllTeams);
  $('.control_button.team_button').on('click', hideForm)
  $('a#deleteTeamButton').on('click', deleteTeam)
});

function deleteTeam() {
  var id = $(this).attr('href').split('/')[2];
  var team = $(this).closest('.team')[0];
  $.ajax({
    type: 'DELETE',
    url: '/teams/'+ id,
    success: function(result) {
      team.remove();
    },
    error: function(e) {
      console.log(e);
      alert("Sorry...something went wrong");
    },
  });
}

function hideForm() {
  $('section#addNewTeam').hide();
}

function hideNewTeamForm() {
  $('section#addNewTeam').hide();
  $('#current_team_container').show();
  // clearFormContentsOnClose();
}

function showNewTeamForm() {
  $('section#addNewTeam').show();
}

function showAllTeams() {
  $('section#viewAllTeams').show();
}

function hideAllTeams() {
  $('section#viewAllTeams').hide();
}

// function addPlayerDetails() {
//   alert("player was clicked...add details!");
// }


// function package_team_info() {
//   var els = $('form#create_new_team')[0].elements;
//   var ageGroup = els[1].value;
//   var playerNum = els[2].value;
//   return {
//     ag :ageGroup,
//     pn :playerNum,
//   }
// }



