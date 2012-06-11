//= require jquery.autoSuggest
$(function() {
    var cities = null;

    //on? On is used to add event handler for newly added element
    $("#user_container").on('click', '.city_tag', function() {
        selectExistingTag($(this), "#user_city_list");
    });


    //hiding input box by default
    $('.auto_suggest > input').hide();    

    var cities = [
         "New York, NY", "Houston, TX", "Los Angeles, CA", "Chicago, IL",
         "Philadelphia, PA", "Pittsburgh, PA", "Phoenix, AZ", "San Antonio, TX",
         "San Diego, CA", "Dallas, TX", "San Jose, CA", "Jacksonville, FL", "Miami, FL",
         "Indianapolis, IN", "San Francisco, CA", "Austin, Texas",
         "Columbus, OH", "Fort Worth, TX", "Charlotte, NC", "Detroit, MI",
         "El Paso, TX", "Memphis, TN", "Baltimore, MD", "Boston, MA",
         "Seattle, WA", "Washington, D.C.", "Nashville, TN", "Denver, CO", 
         "Louisville, KY", "Milwaukee, WI"
    ];

    //Displaying the input field

    $('.auto_suggest > a').click(function(){
        $(this).nextAll('input').show('normal');
        $(this).nextAll('input').focus();
        $(this).hide();
    });

    $( "#new_city_label" ).autocomplete({
        minLength: 2,
        source: cities,
        select: function( event, ui ) {

            var selectedCity = ui.item.value;
            var existingTag = doesTagExist(selectedCity, "city_tag")
            if (existingTag != null) {
                //addClass checks for existing classes before adding
                existingTag.addClass('tag_selected');//Changing Color
            } else {
                //Adding new tag
                $('#city_tags').append('<a href="javascript:void(0)" class="tag city_tag tag_selected">'+ ui.item.value + '</a>');
            }

            //Update the hidden input box
            updateHiddenField(selectedCity, "#user_city_list", true)
            //Post process: Clean up input box, then hide it, then show "Add More" link
            $('.auto_suggest > input').val(null).hide();
            $('.auto_suggest > a').show('normal');
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
    //onkeyup: false,
    //onblur: false,
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
        // fields.each(function(){
        //     var value = $(this).val();
        //     if( value.length < 4 ) {
        //         $(this).addClass('error');
        //         $(this).effect("shake", { times:3 }, 50);
        //         error++;
        //     } else {
        //         $(this).addClass('valid');
        //     }
        // });


        if(!error) {
            //update progress step
            setCurrentProgressStep('#step_three');

            //slide steps
            $('#second_step').slideUp();
            $('#third_step').slideDown();
        } else return false;
    });

    //TODO: Error validation is not happening
    $('#submit_third_next').click(function(e){
        e.preventDefault();//hijack the submit function

        var fields = $('#third_step input[type=text]');
        var error = 0;
        fields.each(function(){
            // var value = $(this).val();
            // if( value.length<1  && !emailPattern.test(value))  {
            //     $(this).addClass('error');
            //     $(this).effect("shake", { times:3 }, 50);

            //     error++;
            // } else {
            //     $(this).addClass('valid');
            // }
        });


        if(!error) { 
            $('.edit_user').submit();
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

//Expandable Fields
$(function() {

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

//Used when existing tag is selected
//@param selectedTagSelector: (Jquery Selector) - tag selected
//@param hiddenTag (String) - hidden field maintain the full list
function selectExistingTag(selectedTagSelector, hiddenTag) {
    var hiddenTagSelector = $(hiddenTag);
    

    if (selectedTagSelector.hasClass('tag_selected')) {
        //DESELECTED
        selectedTagSelector.removeClass('tag_selected');//Changing Color
        updateHiddenField(selectedTagSelector.text(), hiddenTag, false);//updating hidden field       
    } else {
         //SELECTED
        selectedTagSelector.addClass('tag_selected');//Changing Color
        updateHiddenField(selectedTagSelector.text(), hiddenTag, true);//updating hidden field
    }
    //selectedTagSelector.toggleClass('tag_selected');//Changing Color
    //updateHiddenField(selectedTagSelector.text(), hiddenTag);//updating hidden field
} 

function doesTagExist(selectedTagValue, tagClass) {
    var existingTag = null;
    spaceRemovedTagValue = removeWhiteSpace(selectedTagValue)
    $('.' + tagClass).each(
        function(index) {
            if (spaceRemovedTagValue == removeWhiteSpace($(this).text())) {
                existingTag = $(this);
                return false;
            }
        }
    );
    return existingTag;
}

function removeWhiteSpace(text) {
    var spaceFreeText = null;
    spaceFreeText = text.replace(/\s/g, "").toLowerCase();
    return spaceFreeText;
}

// function removeTag(tagList, itemToRemove, delimiter) {
//     var tagArr = null;
//     if (tagList == null) {
//         return;
//     }
//     tagArr = tagList.split(delimiter);
//     tagArr.slice()
// }
//@param selectedItem (String) - the text of selected item
//@param hiddenField (String) - hidden field storing
//all the selected tags. ID or CLASS
//@param add - values should true or false
// @description - If item already exists in the hiddenField, 
// then delete it. Otherwise add it to the list. 
function updateHiddenField(selectedItem, hiddenField, add) {
    var hiddenFieldSelector = $(hiddenField)
    var selectedItemText = removeWhiteSpace(selectedItem);

    //Converting it into array to use splice function to remove
    //Why not just use substring? The white space can be confusing. 
    var tagListArr = hiddenFieldSelector.val().split('|');
    var index = tagListArr.length-1;
    for (; index >= 0; index--) {
        if (removeWhiteSpace(tagListArr[index]) == selectedItemText) {
            break;
        }
    }

    if (add) {
        //Item doesn't exists. ADD
        if (index < 0) {
            tagListArr[tagListArr.length] = selectedItem;
        } 
    } else {
        //Remove item
        tagListArr.splice(index,1);
    }

    hiddenFieldSelector.val(tagListArr.join("|"));
}
