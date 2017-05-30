$(document).ready(function(){
  $('.nav-button').addClass("hidden");
  $('.main-button').click(function(){
    $('.nav-button').toggleClass("hidden");
  }); 
});