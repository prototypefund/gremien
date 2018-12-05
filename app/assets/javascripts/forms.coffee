# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# ----------------------------------------------

($ document).on 'turbolinks:load', ->
  console.log '> script @ forms.coffee'
  
  click_form_group_selector = ->
    #console.log '> click_form_group_selector @ forms.coffee'
    $ich = ($ this)
    group = $ich.data 'group'
    sel = $ich.data 'sel'
    
    #console.log "-- action: click_form_group_selector - group:#{group} - sel:#{sel}"
    ($ ".form_group[data-group=#{group}]").hide()
    ($ ".form_group[data-sel=#{sel}]").show()
  
  
  # --- Initialisierung ------------------------
  
  $main = ($ 'main')
  unless $main.data 'init_forms'
    console.log '-- init'
    $main.on 'click.forms',
        '.field .group_selector',
        click_form_group_selector
    $main.data 'init_forms'
  

