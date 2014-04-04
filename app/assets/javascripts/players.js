// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  $('.player-delete').on('click', deletePlayer);
});

function deletePlayer() {
   var p = $( this );
   var player = p.closest('.player-profile')[0]
   var id = $(p).prev()[0]
                .href
                .split('/')[4]
  alertify.confirm("clicking OK will permanently delete this player", function(e) {
    if (e) {
      $.ajax({
        type: 'DELETE',
        url: '/players/' + id,
        async: false,
        success: function(result) {
          player.remove();
        },
        error: function(e) {
          console.log(e)
          alertify.alert('Whoops! Sorry, we gotta fix that...')
        }
      })
    }
    else {
      return
    }
  });
}
