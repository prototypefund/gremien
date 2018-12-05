# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

($ document).on 'turbolinks:load', ->
  console.log '> script @ cockpit.coffee'
  
  # --- Initialisierung ------------------------
  
  $log_list = ($ '.log_list')
  if $log_list.size() > 0
    unless $log_list.data 'init_cockpit'
      console.log '-- init'
      timeout_id = setTimeout ->
        $.getScript '/cockpit'
      , 5000
      $log_list.data 'cockpit_timeout', timeout_id
      $log_list.data 'init_cockpit', true
    
  

