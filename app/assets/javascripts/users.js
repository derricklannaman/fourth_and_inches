$(document).ready(function(){

  $('a.delete-staff').on('click', deleteStaff);


});

function deleteStaff() {
  var thisLink = $( this );
  var pod = thisLink.closest('div.show-user-box');
  var id = thisLink.prev()
              .attr('href')
              .split('/')[2]

  $.ajax({
    type: 'DELETE',
    url: '/users/' + id,
    success: function(result) {
      console.log('works');
    },
    error: function(e) {
      console.log(e);
      whoopsErrorMessage();
    }
  });
}