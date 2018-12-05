# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# ----------------------------------------------

($ document).on 'turbolinks:load', ->
  console.log '> script @ general.coffee'
  
  flash_hide = ->
    ($ '.flash').addClass 'up'
  
  
  flash_hide_back = ->
    ($ '#flash_layer').addClass 'away'
  
  
  # --- Initialisierung ------------------------
  
  # adjust flash to hide after few seconds
  flash_timer = window.setTimeout flash_hide, 2000
  flash_back_timer = window.setTimeout flash_hide_back, 1000

