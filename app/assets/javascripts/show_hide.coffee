# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# ----------------------------------------------

($ document).on 'turbolinks:load', ->
  console.log '> script @ show_hide.coffee'
  
  show_hide = ->
    $ich = ($ this)
    console.log "-- show_hide - #{$ich.data 'sel'} @ show_hide.coffee"
    ziel = $ich.attr 'href'
    kind = $ich.data 'kind'
    hat_ziel = ( ziel isnt '#' )
    
    sel = $ich.data 'sel'
    sel = ziel unless sel
    console.log "-- action: show_hide - sel:#{sel}"
    if kind is 'fade'
      ($ sel).fadeToggle 200
    else
      ($ sel).slideToggle 200
    
    return false # hat_ziel
  
  
  # --- Initialisierung ------------------------
  
  $main = ($ 'main')
  unless $main.data 'init_show_hide'
    console.log '-- init'
    $main.on 'click.show_hide',
        '[data-action=show_hide]',
        show_hide
    $main.data 'init_show_hide', true
  
  $header = ($ 'header')
  unless $header.data 'init_show_hide'
    console.log '-- init'
    $header.on 'click.show_hide',
        '[data-action=show_hide]',
        show_hide
    $header.data 'init_show_hide', true
  

