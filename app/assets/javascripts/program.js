$(document).ready(function(){
  $('.not-yet-implemented').on('click', notYetImplemented)
});


function notYetImplemented() {
  alertify.alert("This feature has not been implemented yet!");
}