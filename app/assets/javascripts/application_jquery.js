
function remove_fields(link, field) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(field).remove();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}

