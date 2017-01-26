$(document).ready(function() {

  $('.cell').on("mouseenter", function() {
    $('.cell').css('background-color', '#CCE9F8');
    $(this).closest('.cell').css('background-color', 'gray');
  });

});
