# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# ----------------------------------------------

($ document).on 'turbolinks:load', ->
  console.log '> script @ expander_text.coffee'
  
  text_expand = ->
    $ich = ($ this)
    sel = $ich.data 'sel'
    console.log "-- action: text_expand - sel:#{sel}"
    ($ sel).slideToggle 200
    $ich.find '.collapser'
        .toggle()
    $ich.find '.expander'
        .toggle()
    return false # hat_ziel
  
  
  # --- Initialisierung ------------------------
  
  $main = ($ 'main')
  unless $main.data 'init_expander_text'
    console.log '-- init'
    $main.on 'click.expander_text',
        '[data-action=text_expand]',
        text_expand
    $main.data 'init_expander_text', true
  

