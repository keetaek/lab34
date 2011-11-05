// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


(function($){
  var nav = $("#topNav");
  nav.find("li").each(function() {
    if($(this).find("ul").length > 0) {
      $("<span>").text("^").appendTo($(this).children(":first"));
      
      //show subnav on hover
      $(this).mouseenter(function() {
        $(this).find("ul").stop(true, true).slideDown();
      });
      
      //hide submenus on exit
      $(this).mouseleave(function() {
        $(this).find("ul").stop(true, true).slideUp();
      });
    }
  })(jQuery);
});
