// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  $('#new-team-form, section#editTeam').add('section#addNewTeam2').hide();
  $('#new-team-side-link').on('click', showNewTeamForm)
  $('#createTeamButton').on('click', createNewTeam);
  $('.teamBrand').on('click', showPlayers)
  $('#new-team-side-link').avgrund({
      onBlurContainer: '.app-container',
      template: $('section#addNewTeam'),
      width: 456,
      height: 336,
  });

  $('#edit-team-side-link').avgrund({
    template: $('section#editTeam'),
    onLoad: function(element) {
      console.log(element);
      var id = " "
      $.ajax({
        type: 'GET',
        url: '/teams/'+ id + '/edit',
        success: function(result) {
          var e = $('section#editTeam');
          var title = $(e).find('#team_title');
          var info = result.update
          $(e).find('#team_title')[0].value = info.title
          $(e).find('#team_age_group > option')[0].innerText = info.group
          $(e).find('#team_num_of_players')[0].value = info.num
        },
        error: function(e) {
          alert('Oops...something went wrong')
        }
      });
      $('section#editTeam').css('display', 'block')
    }
  });

  $('a[disabled=disabled]').click(function(event){
      event.preventDefault(); // Prevent link from following its href
  });

});

function showPlayers() {
  alert('show players')
}

function getTeamInfoToEdit() {
  console.log();
}

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
      // $(f).hide()

      var teamShell = result.team_info;
      var c = teamShell.name.toUpperCase();
      var h = " Football Team";
      var g = teamShell.group;
      var current = $('section#currentTeam');
      current.find('h3').text(c+h);
      current.find('h5').text(g);
      changeCurrentPlayerCount(current, teamShell);
    },
    error: function(e) {
      alert("Sorry, something when wrong...");
    }
  });
}

function changeCurrentPlayerCount(current, teamShell) {
  var x = current.find('p')[0]
  var str = $(x).text()
                .trim()
                .split(' ');
  str[str.length-1] = teamShell.num;
  var new_num = str.join(' ');
  $(x).text(new_num);
}


function showNewTeamForm() {
  $('#new-team-form').show();
  console.log('showNewTeamForm');
}
