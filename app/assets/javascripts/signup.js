$(document).ready(function() {
  $('.main-navbar-link-container').on('click', '#sign_up', function(event) {
  event.preventDefault();
  $.ajax({
    url: event.target.href,
  }).done(function(response) {
    $('body').html(response)
  }).fail(function(error){
    console.log("Error: " + error)
  })
  })
})
