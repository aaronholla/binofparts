# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $(".category a").click ->
    event_key = $("#categories").data('event-key')
    $.ajax
      url: "/new_request/set_cat"
      type: "GET"
      data:
        category: $(this).text()
        event: event_key
      dataType: "script"
    $(".modal-title").text("Select a Part")
    return

  $("#request-list-back").click ->
    document.getElementById("parts-list").style.display = "none"
    document.getElementById("categories").style.display = "block"
    document.getElementById("new-request-parts-list").innerHTML = ""
    $(".modal-title").text("Select a Category")
    return
    
  $(".request-modal").on "hidden.bs.modal", (e) ->
    document.getElementById("parts-list").style.display = "none"
    document.getElementById("categories").style.display = "block"
    document.getElementById('request-list-back').style.display='block';
    document.getElementById("new-request-parts-list").innerHTML = ""
    $(".modal-title").text("Select a Category")
    return

  $("#new-request-parts-list").on "click", ".part", ->
  	part_id = $(".part").data('part-id')
  	event_key = $(".part").data('event-key')
  	$.ajax
      url: "/new_request/set_part"
      type: "GET"
      data:
        part_id: part_id
        event: event_key
      dataType: "script"

  	return

  return
	

$(document).ready(ready)
$(document).on('page:load', ready)
