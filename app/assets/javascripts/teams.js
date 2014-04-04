// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  $('.player-action-sublist').hide();
  $('#player-button').on('click', showPlayerOptions);
  $('#team-mgr-button').on('click', showTeamOptions);
  // $('#new-team-side-link').avgrund({
  //     onBlurContainer: '.app-container',
  //     template: $('section#addNewTeam'),
  //     width: 456,
  //     height: 336,
  // });


  $('a[disabled=disabled]').click(function(event){
      event.preventDefault(); // Prevent link from following its href
  });

});

function showTeamOptions() {
  $('.team-action-sublist').slideToggle(300)
}

function showPlayerOptions() {
  $('.player-action-sublist').slideToggle(150)
}

// function getTeamInfoToEdit() {
//   console.log();
// }

// function createNewTeam() {
//   var f = $('#new-team-form')[0];
//   var title = $(f).find('#team_title')[0].value;
//   var age = $(f).find('#team_age_group')[0].value;
//   var num = $(f).find('#team_num_of_players')[0].value;
//   var formData = {
//     title:  title,
//     age:    age,
//     num:    num,
//   }
//   $.ajax({
//     type: 'POST',
//     url: '/teams',
//     data: { team: formData },
//     success: function(result) {
//       // $(f).hide()

//       var teamShell = result.team_info;
//       var c = teamShell.name.toUpperCase();
//       var h = " Football Team";
//       var g = teamShell.group;
//       var current = $('section#currentTeam');
//       current.find('h3').text(c+h);
//       current.find('h5').text(g);
//       changeCurrentPlayerCount(current, teamShell);
//     },
//     error: function(e) {
//       alert("Sorry, something when wrong...");
//     }
//   });
// }

// function changeCurrentPlayerCount(current, teamShell) {
//   var x = current.find('p')[0]
//   var str = $(x).text()
//                 .trim()
//                 .split(' ');
//   str[str.length-1] = teamShell.num;
//   var new_num = str.join(' ');
//   $(x).text(new_num);
// }


// function showNewTeamForm() {
//   $('#new-team-form').show();
//   console.log('showNewTeamForm');
// }
