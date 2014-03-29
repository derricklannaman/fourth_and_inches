// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){

  $('a[disabled=disabled]').click(function(event){
      event.preventDefault(); // Prevent link from following its href
  });


});

function toggleSubList() {
  var navSubList = $('li .team-action-sublist');
  console.log(navSubList);
}
