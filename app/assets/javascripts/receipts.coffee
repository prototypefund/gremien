# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

($ document).on 'turbolinks:load', ->
  console.log '> script @ receipts.coffee'
  
  do_vote = ( in_event ) ->
    console.log '> do_vote @ receipts.coffee'
    
    $me = ($ this)
    kind = $me.data 'vote'
    $voting = $me.closest '.voting'
    $voting.find '.button_group'
        .hide()
    $form = $voting.find 'form'
    $form.show()
    $form.find ".vote_button.#{kind}"
        .show()
    $form.find 'input#vote'
        .prop 'value', kind
    
    return false
  
  
  # --- Initialisierung ------------------------
  
  $vote_area = ($ '.voting')
  unless $vote_area.data 'init_receipts'
    console.log '-- init'
    $vote_area.on 'click.receipts',
        '[data-action="vote_button"]',
        do_vote
    $vote_area.data 'init_procedures', true
  

