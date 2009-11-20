// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
window.onload = function(){
  $('a.button').wrapInner('<span class="button_span"></span>');
}

$(function  () {
  $('#user_login').hover(
    function  () {
      $('#user_menu').show();
    },
    function  () {
      $('#user_menu').hide();
    }
  );
});
