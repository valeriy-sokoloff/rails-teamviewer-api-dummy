# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('body').on('click', '#test_ping_btn', ->
  $.get(
    '/auth/teamviewer/test_ping',
    (data) ->
      console.log data
      $('p#result').html( data )
  )
)
