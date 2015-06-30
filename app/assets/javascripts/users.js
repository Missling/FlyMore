$(document).ready(function() {
  $(".edit").on("click", function(event) {
    event.preventDefault();
    $("form.edit_user").show();
    $(this).hide();
  });
})
