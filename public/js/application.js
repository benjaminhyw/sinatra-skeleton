$(document).ready(function() {
  $("#register").on("click", function(event){
    event.preventDefault();
    var ajax = $.ajax({
      url: 'users/new',
      type: 'GET'
    });
    ajax.done(function(createUser){
      $("#form-container").append(createUser);
    })
    // $("#form-container").append("#registration-form");
  })

});
