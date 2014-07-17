$(document).ready(function(){

  (function() {
   $('dd').filter(':nth-child(n+4)').addClass('hide_dd');
   $('dl').on('mouseenter', 'dt', function(){
      $(this)
        .next()
          .slideDown(200)
            .siblings('dd')
              .slideUp(200);
   });

  })();



});