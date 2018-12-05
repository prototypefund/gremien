# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# ----------------------------------------------

($ document).on 'turbolinks:load', ->
  console.log '> script @ dialogs.coffee'
  
  show_dialog = ( in_dialog ) ->
    $ich = in_dialog
    console.log "> show_dialog @ dialogs.coffee - id:#{$ich.attr 'id'} class:#{$ich.prop 'class'}"
    
    $ich.removeClass 'prepared'
    # attach close handler to buttons
    $ich.find '.button'
        .on 'click.dialogs',
              remove_dialog
    
  
  
  remove_dialog = ->
    $ich = ($ '.dialog_layer')
    console.log "> remove_dialog @ dialogs.coffee - id:#{$ich.attr 'id'} class:#{$ich.prop 'class'}"
    
    $ich.remove()
  
  
  # --- Initialisierung ------------------------
  
  $dialog = ($ '.dialog_layer')
  show_after = Number( $dialog.data 'show-after' )
  console.log "-- show_after:#{show_after * 1000}"
  
  if show_after > 0 and !$dialog.data 'show_dialog_timer'
    t = window.setTimeout show_dialog, show_after * 1000, $dialog
    $dialog.data 'show_dialog_timer', t
  

