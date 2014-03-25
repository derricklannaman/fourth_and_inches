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
});

function hideForm() {
  $('section#addNewTeam').hide();
}

function hideNewTeamForm() {
  $('section#addNewTeam').hide();
  $('#current_team_container').show();
}

function showNewTeamForm() {
  // $('#current_team_container').hide();
  $('section#addNewTeam').show();
}

function showAllTeams() {
  $('section#viewAllTeams').show();
}

function hideAllTeams() {
  $('section#viewAllTeams').hide();
}



// function showNewTeamForm() {
//   $('#new_team_form').toggle('show');
// }

// function buildNewTeam() {
  // var teamInfo = package_team_info();

  // var t = $('#created_team');
  // var c = t.children()[1];

  // if ( c.id == 'teamTemplate' ) {
  //   document.getElementById('create_team_button').disabled;
  //   // $('#create_team_button').attr('disabled', true);
  // }
  // else {
//     $.ajax({
//       type: "POST",
//       url: "/teams",
//       dataType: "json",
//       data: {
//         team: teamInfo
//       },
//       success: function(result) {
//         // $('#create_team_button').attr('disabled', true);
//        document.getElementById('create_team_button').disabled;


//         var team = result;
//         var title = team.team_info.team_shell.title;
//         var players = team.team_info.players_shell;

//         var team_outline  = $('<div id="teamTemplate"></div>')
//         var team_title    = $('<div><strong>'+ title +'</strong></div>')

//         $("#created_team").prepend(team_outline);
//         var t = document.getElementById('teamTemplate');
//         team_title.insertBefore(t);
//         for (var i = 0; i < players.length; i++) {
//           var player = "player_";
//           var id = players[i].id;
//           var player_id = player + id;
//           var p = $('<div id="'+ player_id +'" class="playerPlaceHolder"></div>');


//           $(t).append(p);
//         };
//         var phs = $('.playerPlaceHolder');
//         for (var i = 0; i < phs.length; i++) {
//           phs[i].onclick = addPlayerDetails;
//         };
//        },
//       error: function(e) {
//         console.log(e)
//       }
//     });
//   // }
// }

// function buildPlayerPlaceHolder(players) {
//   console.log(players.length);
// }


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



