// TODO: Set page guard
$(document).ready(function() {
  $('a.manager-button').hover(ringLightOn, ringLightOff);
});

function ringLightOn() {
  var ring = $( this );
  var outer = ring.closest('div.outer-rink')
  outer.addClass('ring-light-on');
}

function ringLightOff() {
  var ring = $( this );
  var outer = ring.closest('div.outer-rink')
  outer.removeClass('ring-light-on');
}