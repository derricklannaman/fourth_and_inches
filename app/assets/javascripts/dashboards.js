// TODO: Set page guard
$(document).ready(function() {
  $( '#tp-grid' ).stapel({
    onBeforeOpen : function( pileName ) {
      // ajax to players index
      $.ajax({
        type: 'GET',
        url: '/players',
        success: function(result) {
          // console.log(result);
          var players = result;
          var p = $('div.tp-title').find('span')[1];
          var count = $(p).text('6');

          for (var i = 0; i < players.length; i++) {
            console.log(players[i].first_name);
            var li = $("<li data-pile='Uniondale knights'>")
            li.attr('style',"display: list-item; z-index: 9999; visibility: visible; transition: none; -webkit-transition: none; left: 320px; top: 0px; box-shadow: rgba(0, 0, 0, 0.2) 0px 2px 3px 0px;")

            var img = $('<img>', {src: "/assets/helmet.png"}).appendTo(li)

            $(li).appendTo('ul#tp-grid.tp-grid');

          }

        },
        error: function(e) {
          console.log(e);
          alert("failed");
        }
      });
    }
  });
});

    // %li{"data-pile" => "Uniondale Knights"}
    //   %a{href: "http://drbl.in/eiUm"}
    //     %span.tp-info
    //       %span On to Easter
    //     %img{src: "/assets/helmet.png", width: '100'}/