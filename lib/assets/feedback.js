// Sliding Feedback Panel

// $(document).ready(function(){
//   $('#feedback_tab').on('click', openFeedBack)
//   $('#submit_feedback_button').on('click', closeFeedBack)
// });

//   function openFeedBack() {
//     if ( $('#feedback_form').hasClass('isOpen') ) {
//       concealFeedBackForm();
//       moveTabWithForm();
//     }
//     else {
//      $(this).animate({right: "+=303"}, 500)
//       $('#feedback_form').animate({
//           width: 'toggle',
//           opacity: 1
//       }, 500, function(){
//         $(this).addClass('isOpen');
//       })
//     }
//   }

//   function closeFeedBack() {
//     sendUserFeedback();
//     concealFeedBackForm();
//     moveTabWithForm();
//   }

//   function moveTabWithForm() {
//     return $('#feedback_tab').animate({right: "-=0"}, 500, function(){
//     })
//   }

//   function concealFeedBackForm() {
//    $('#feedback_form').animate({
//           width: 'toggle',
//           opacity: 0.25
//           }, 500,function(){
//     $(this).removeClass('isOpen');
//     clearFeedBackForm();
//       })
//   }

//   function clearFeedBackForm() {
//     var f = $('#feedback_form');
//     var c = f.children();
//     $(c[1]).find('input')[0].value = '';
//     $(c[2]).find('input')[0].value = '';
//     $(c[3])[0].children[0].value = '';
//   }

//   function sendUserFeedback() {
//       return $('#feedback_form').on('ajax:success', function(data) {
//       alertify.success('Thanks for the feedback!');
//     }).bind("ajax:error", function(e) {
//       alertify.error('Sorry, there was an error');
//     });
//   }