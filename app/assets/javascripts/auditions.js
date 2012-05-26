$(function(){
  
  //Adding datepicker
  $("#audition_deadline_date").datepicker(); 

    //original field values
  var v = $("#new_audition").validate({
    errorClass: 'error',
    validClass: 'valid',
    onkeyup: false,
    onblur: false,
    errorPlacement: function(error, element) {
      error.insertBefore( element.prev() );
    }
    //submitHandler: function() {
      //alert("Submitted thanks");
    //}
    
  });
    //reset progress path
    setCurrentProgressStep('#step_one');
    
    $('#submit_first_next').click(function(e){
        e.preventDefault();
        
        //remove classes
        $('#first_step input').removeClass('error').removeClass('valid');

        //TODO: Add validation for calendar and zip code
        //if(!error) {
        if(v.form()) {
            //update progress step
            setCurrentProgressStep('#step_two');

            //slide steps
            $('#first_step').slideUp();
            $('#second_step').slideDown(); 
        } else {
          return false;
        }
    });

    $('#submit_second_next').click(function(e){
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
            setCurrentProgressStep('#step_three');

            //slide steps
            $('#second_step').slideUp();
            $('#third_step').slideDown();
        } else return false;
    });

    $('#submit_third_next').click(function(e){
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
          $('#new_audition').submit();
        } else return false;
    });


/* Setting up 'back' buttons */
    $('#submit_second_back').click(function(e){
        e.preventDefault();//hijack the submit function
        setCurrentProgressStep('#step_one');
        $('#second_step').slideUp();
        $('#first_step').slideDown();
    });
    $('#submit_third_back').click(function(e){
        e.preventDefault();//hijack the submit function
        setCurrentProgressStep('#step_two');
        $('#third_step').slideUp();
        $('#second_step').slideDown();
    });
});

function setCurrentProgressStep (step) {
    $('#step_one').removeClass("current");
    $('#step_two').removeClass("current");
    $('#step_three').removeClass("current");
    $('#step_four').removeClass("current");
    $(step).addClass("current");
}