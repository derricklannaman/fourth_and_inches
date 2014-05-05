$(document).ready(function(){

  $('a.delete-staff').on('click', deleteStaff);


})

function deleteStaff() {
  console.log(this);
  // alert("This works!");
}