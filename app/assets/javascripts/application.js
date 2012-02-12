// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
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

$(function() {
  $("#audition_deadline_date").datepicker();
});

$(function(){
    //original field values
    var field_values = {
            //id        :  value
            'audition_title'  : '',
            'audition_type'  : '',
            'audition_deadline_date' : '',
            'audition_description'  : '',
            'audition_zip'  : ''
    };

    $('input#audition_title').val(field_values['audition_title']);
    $('input#audition_type').val(field_values['audition_type']);
    $('input#audition_deadline_date').val(field_values['audition_deadline_date']);
    $('input#audition_description').val(field_values['audition_description']);
    $('input#audition_zip').val(field_values['audition_zip']);

    //reset progress path
    $('#step_one').addClass("current");
    $('#step_two').removeClass("current");
    $('#step_three').removeClass("current");
    $('#step_four').removeClass("current");
    
    $('#submit_first').click(function(e){
        e.preventDefault();
        //remove classes
        $('#first_step input').removeClass('error').removeClass('valid');

        //ckeck if inputs aren't empty
        var fields = $('#first_step input[type=text], #first_step textarea');
        var error = 0;
        fields.each(function(){
            var value = $(this).val();
            if( value.length < 4 ) {
                $(this).addClass('error');
                $(this).effect("shake", { times:3 }, 50);
                error++;
            } else {
                $(this).addClass('valid');
            }
        });
        //TODO: Add validation for calendar and zip code
        if(!error) {
            //update progress step
            $('#step_one').removeClass("current");
            $('#step_two').addClass("current");
            $('#step_three').removeClass("current");
            $('#step_four').removeClass("current");

            //slide steps
            $('#first_step').slideUp();
            $('#second_step').slideDown(); 
        } else {
          return false;
        }
    });

    $('#submit_second').click(function(){
        //remove classes
        $('#second_step input').removeClass('error').removeClass('valid');

        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        var fields = $('#second_step input[type=text]');
        var error = 0;
        fields.each(function(){
            var value = $(this).val();
            if( value.length<1 || value==field_values[$(this).attr('id')] || ( $(this).attr('id')=='email' && !emailPattern.test(value) ) ) {
                $(this).addClass('error');
                $(this).effect("shake", { times:3 }, 50);

                error++;
            } else {
                $(this).addClass('valid');
            }
        });

        if(!error) {
                //update progress bar
                $('#progress_text').html('66% Complete');
                $('#progress').css('width','226px');

                //slide steps
                $('#second_step').slideUp();
                $('#third_step').slideDown();
        } else return false;

    });

    $('#submit_third').click(function(){
        //update progress bar
        $('#progress_text').html('100% Complete');
        $('#progress').css('width','339px');

        //prepare the fourth step
        var fields = new Array(
            $('#username').val(),
            $('#password').val(),
            $('#email').val(),
            $('#firstname').val() + ' ' + $('#lastname').val(),
            $('#age').val(),
            $('#gender').val(),
            $('#country').val()
        );
        var tr = $('#fourth_step tr');
        tr.each(function(){
            //alert( fields[$(this).index()] )
            $(this).children('td:nth-child(2)').html(fields[$(this).index()]);
        });

        //slide steps
        $('#third_step').slideUp();
        $('#fourth_step').slideDown();
    });

    $('#submit_fourth').click(function(){
        //send information to server
        alert('Data sent');
    });

});
