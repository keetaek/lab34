//= require jquery.autoSuggest
$(function() {
  var cache = {},lastXhr = null, city_list = new Array(), cities = null;

    $(".city_tag").click(function() {
    	var currText = $(this).text().trim();
    	var index = city_list.indexOf(currText);
    	
    	if (index == -1) {
    		//Item doesn't exist. Add
    		city_list[city_list.length] = currText;
    	} else {
    		//Item exists. Remove
    	city_list.splice(index,1);
    	}
    $('#user_city_list').val(city_list.join("|"));
    });

    cities = [
         "New York, NY", "Houston, TX", "Los Angeles, CA", "Chicago, IL",
         "Philadelphia, PA", "Pittsburgh, PA", "Phoenix, AZ", "San Antonio, TX",
         "San Diego, CA", "Dallas, TX", "San Jose, CA", "Jacksonville, FL",
         "Indianapolis, IN", "San Francisco, CA", "Austin, Texas",
         "Columbus, OH", "Fort Worth, TX", "Charlotte, NC", "Detroit, MI",
         "El Paso, TX", "Memphis, TN", "Baltimore, MD", "Boston, MA",
         "Seattle, WA", "Washington, D.C.", "Nashville, TN", "Denver, CO", 
         "Louisville, KY", "Milwaukee, WI"
    ];
     
    $( "#new_city_label" ).autocomplete({
        minLength: 2,
        source: cities,
        select: function( event, ui ) {
            $('#city_tags').append('<a href="javascript:void(0)" class="tag city_tag">'+ ui.item.value + '</a>');
            return false;
        }
    });
});

$(function(){
  
  //Adding datepicker
  $("#audition_deadline_date").datepicker(); 

    //original field values
  var v = $(".edit_user").validate({
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
            //setCurrentProgressStep('#step_two');

            //slide steps
            //$('#first_step').slideUp();
            //$('#second_step').slideDown(); 
            $('.edit_user').submit();

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

$(function() {

    //Change tag color when s
	$('.city_tag').click(function() {
		$(this).toggleClass('tag_selected');
	});

	//The anchor tag should be wrapped around label tag
	$('.expandable > a').each(function(){
		var currVal = $(this).text();
		$(this).text(currVal + " +");
		$(this).css('color', 'blue');
		$(this).click(function() {
			$(this).nextAll('input').show('normal');
			$(this).nextAll('textarea').show('normal');
			$(this).text($(this).text().replace(" +",""));
			$(this).removeAttr('href');
		});
	});
	$('.expandable > input,.expandable > textarea').hide('normal');
    
});

function setCurrentProgressStep (step) {
    $('#step_one').removeClass("current");
    $('#step_two').removeClass("current");
    $('#step_three').removeClass("current");
    $('#step_four').removeClass("current");
    $(step).addClass("current");
}

function addNewTag(currTag, city_list) {
    var currText = currTag.text().trim();
    var index = city_list.indexOf(currText);
    
    if (index == -1) {
        //Item doesn't exist. Add
        city_list[city_list.length] = currText;
    } else {
        //Item exists. Remove
        city_list.splice(index,1);
    }
}