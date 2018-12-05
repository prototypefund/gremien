# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# ----------------------------------------------

($ document).on 'turbolinks:load', ->
  console.log '> script @ expander_arguments.coffee'
  
  argument_expand = ->
    $ich = ($ this)
    console.log "-- action: argument_expand - id:#{$ich.attr 'id'}"
    $ich.removeClass 'collapsed'
        .addClass 'expanded'
    return false
  
  
  argument_collapse = ->
    $ich = ($ this)
    console.log "-- action: argument_collapse - id:#{$ich.attr 'id'}"
    $ich.closest '.argument_preview'
        .addClass 'collapsed'
        .removeClass 'expanded'
    return false
  
  
  # --- Initialisierung ------------------------
  
  $arguments_list = ($ '.arguments_list')
  unless $arguments_list.data 'init_arguments_list'
    $arguments_list.on 'click.expander_arguments',
        '.argument_preview.collapsed',
        argument_expand
    $arguments_list.on 'click.expander_arguments',
        '.argument_preview.expanded .toggler, .argument_preview.expanded .title',
        argument_collapse
    $arguments_list.data 'init_arguments_list', true
  

