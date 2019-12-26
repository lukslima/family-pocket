$(document).on('turbolinks:load', function(){
  $('.tabs').tabs({
    swipeable: true
  });
  $('select').formSelect();
  $('.datepicker').datepicker();
});