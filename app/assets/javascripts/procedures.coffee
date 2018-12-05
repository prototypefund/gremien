# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

($ document).on 'turbolinks:load', ->
  console.log '> script @ procedures.coffee'
  
  arguments_nav_toggler = ( in_event ) ->
    console.log '> arguments_nav_toggler @ procedures.coffee'
    
    me = ($ this)
    unless me.has_class? 'active'
      kind = me.data 'kind'
      ($ '.nav_column')
            .removeClass 'active'
      me.addClass 'active'
      ($ '.arguments_column')
            .removeClass 'active'
      ($ ".arguments_column[data-kind=#{kind}]")
            .addClass 'active'
    
  
  
  # --- Initialisierung ------------------------
  
  $nav = ($ 'nav.arguments_nav')
  unless $nav.data 'init_procedures'
    console.log '-- init'
    $nav.on 'click.procedures',
        '.nav_column'
        arguments_nav_toggler
    $nav.data 'init_procedures', true
  

