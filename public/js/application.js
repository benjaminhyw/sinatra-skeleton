$(document).ready(function() {
  $("#register").on("click", function(event){
    event.preventDefault();
    var ajax = $.ajax({
      url: 'users/new',
      type: 'GET'
    });
    ajax.done(function(createUser){
      $("#form-container").empty();
      $("#form-container").append(createUser);
    })
  })

  $("#login").on("click", function(event){
    event.preventDefault();
    var ajax = $.ajax({
      url: 'login',
      type: 'GET'
    });
    ajax.done(function(loginUser){
      $("#form-container").empty();
      $("#form-container").append(loginUser);
    })
  })
});
