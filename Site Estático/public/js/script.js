$(document).ready(function(){
  $(window).bind('scroll', function(){
      var gap = 50;

      if($(window).scrollTop() > gap){
          $('.navbar').addClass('active');
      }else{
          $('.navbar').removeClass('active');
      }
  })
})