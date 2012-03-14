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
  $("#audition_deadline_date").datepicker(); //Adding datepicker
});

//Validator
$(function(){
//Step1
        //ckeck if inputs aren't empty
        /*
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

//Step2
        var fields = $('#second_step input[type=text], #second_step textarea');
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
//Step3
        var fields = $('#third_step input[type=text]');
        var error = 0;
        fields.each(function(){
            var value = $(this).val();
            //TODO: Use JQuery Validator plugin to check confirm field is same
            if( value.length<1  && !emailPattern.test(value))  {
                $(this).addClass('error');
                $(this).effect("shake", { times:3 }, 50);

                error++;
            } else {
                $(this).addClass('valid');
            }
        });
        */


        
});
$(function(){
  
  $.validator.addMethod("postalcode", function(postalcode, element) {
    return this.optional(element) || postalcode.match(/(^\d{5}(-\d{4})?$)|(^[ABCEGHJKLMNPRSTVXYabceghjklmnpstvxy]{1}\d{1}[A-Za-z]{1} ?\d{1}[A-Za-z]{1}\d{1})$/);
  }, "Please specify a valid postal/zip code");
    //original field values
  var v = $("#new_audition").validate({
    errorClass: 'error',
    validClass: 'valid',
    onkeyup: false,
    onblur: false,
    errorPlacement: function(error, element) {
      error.insertBefore( element.prev() );
    },
    submitHandler: function() {
      alert("Submitted thanks");
    }
    
  });
    var field_values = {
            //id        :  value
            'audition_title'  : '',
            'audition_type'  : '',
            'audition_deadline_date' : '',
            'audition_description'  : '',
            'audition_zip'  : ''
    };
/*
    $('input#audition_title').val(field_values['audition_title']);
    $('input#audition_type').val(field_values['audition_type']);
    $('input#audition_deadline_date').val(field_values['audition_deadline_date']);
    $('input#audition_description').val(field_values['audition_description']);
    $('input#audition_zip').val(field_values['audition_zip']);
*/
    //reset progress path
    $('#step_one').addClass("current");
    $('#step_two').removeClass("current");
    $('#step_three').removeClass("current");
    $('#step_four').removeClass("current");
    
    $('#submit_first').click(function(e){
        e.preventDefault();
        
        //remove classes
        $('#first_step input').removeClass('error').removeClass('valid');
        /*
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
        */
        //TODO: Add validation for calendar and zip code
        //if(!error) {
        if(v.form()) {
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

    $('#submit_second').click(function(e){
        e.preventDefault();//hijack the submit function

        //remove classes
        $('#second_step input').removeClass('error').removeClass('valid');
        //ckeck if inputs aren't empty
        var fields = $('#second_step input[type=text], #second_step textarea');
        var error = 0;
        //TODO: Hidden field shouldn't be affected by the validation.
        //TODO Add validation
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


        if(!error) {
            //update progress step
            $('#step_one').removeClass("current");
            $('#step_two').removeClass("current");
            $('#step_three').addClass("current");
            $('#step_four').removeClass("current");
            //slide steps
            $('#second_step').slideUp();
            $('#third_step').slideDown();
        } else return false;
    });

    $('#submit_third').click(function(e){
        e.preventDefault();//hijack the submit function

        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        var fields = $('#third_step input[type=text]');
        var error = 0;
        fields.each(function(){
            var value = $(this).val();
            //TODO: Use JQuery Validator plugin to check confirm field is same
            if( value.length<1  && !emailPattern.test(value))  {
                $(this).addClass('error');
                $(this).effect("shake", { times:3 }, 50);

                error++;
            } else {
                $(this).addClass('valid');
            }
        });
        if(!error) {
          //update progress step
          $('#step_one').removeClass("current");
          $('#step_two').removeClass("current");
          $('#step_three').removeClass("current");
          $('#step_four').addClass("current");
          //slide steps
          $('#third_step').slideUp();
          $('#fourth_step').slideDown();
        } else return false;
        
        /*
        var tr = $('#fourth_step tr');
        tr.each(function(){
            //alert( fields[$(this).index()] )
            $(this).children('td:nth-child(2)').html(fields[$(this).index()]);
        });
*/


    });

    $('#submit_fourth').click(function(){
        //send information to server
        alert('Data sent');
    });

});
