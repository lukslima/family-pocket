$(document).on('ready turbolinks:load', function(){
  M.Sidenav._sidenavs = [];
  $('.sidenav').sidenav();

  $('.tabs').tabs({swipeable: true});
  $('select').formSelect();
  $('.datepicker').datepicker();
  // $('.money-mask').maskMoney('mask', parseFloat($('.money-mask').val()));
  $('.money-mask').maskMoney();
});
  