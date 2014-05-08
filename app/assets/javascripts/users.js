$(document).ready(function(){
  $('a.delete-staff').on('click', deleteStaff);
});

function deleteStaff() {
  var thisLink = $( this );
  var pod = thisLink.closest('div.show-user-box');
  var id = thisLink.prev()
              .attr('href')
              .split('/')[2]
  alertify.confirm("Permanently delete this staff member?", function(e) {
    if (e) {
      $.ajax({
        type: 'DELETE',
        url: '/users/' + id,
        success: function(result) {
          console.log('works');
          var prev = document.referrer
          location.assign(prev)
        },
        error: function(e) {
          console.log(e);
          whoopsErrorMessage();
        }
      });
    }
    else {
      return
    }
  });
}