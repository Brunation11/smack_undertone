$(document).ready(function() {
  $('nav').on('click', '#sign-up', function(event) {
  event.preventDefault();
  $.ajax({
    url: event.target.href,
  }).done(function(response) {
    $('.main-content-container').html(response)
  }).fail(function(error){
    console.log("Error: " + error)
  })
  });
  $('.sign-up-button').on('submit', '#confirm-sign-up', function(event) {
    event.preventDefault();
    $.ajax({
      method: 'POST',
      url: event.target.href,
      data: $(event.target).serialize()
    }).done(function(response) {
      $('.main-content-container').html(response)
    }).fail(function(error){
      console.log("Error: " + error)
    })
  })
})
