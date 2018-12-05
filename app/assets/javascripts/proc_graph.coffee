# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

($ document).on 'turbolinks:load', ->
  console.log '> script @ proc_graph.coffee'
  
  # --- Variables ------------------------------
  
  search_input_timer = null
  $selectors = null
  $procs = null
  
  # --- Methods --------------------------------
  
  search_input = ( in_event ) ->
    if search_input_timer isnt null
      window.clearTimeout search_input_timer
    
    search_input_timer = window.setTimeout process_search, 500
  
  
  process_search = ->
    console.log "> process_search @ proc_graph.coffee"
    $search_field = ($ '.search_block input[type=search]')
    search_text = $search_field.val().toLowerCase()
    
    $selectors ?= ($ '.selector_list.searchable .selector')
    $selectors.each (i, e ) ->
      $sel = ($ e)
      title = $sel.attr( 'title' ) or ''
      
      if search_text.length < 3 or title.toLowerCase().includes search_text
        $sel.show() if $sel.css( 'display' ) == 'none'
      else
        $sel.hide() if $sel.css( 'display' ) == 'block'
      
    
    $procs ?= ($ '.procedure_block')
    $procs.each (i, e) ->
      $proc = ($ e)
      title = $proc.attr( 'title' ) or ''
      
      if search_text.length < 3 or title.toLowerCase().includes search_text
        $proc.show() if $proc.css( 'display' ) == 'none'
      else
        $proc.hide() if $proc.css( 'display' ) == 'block'
      
    
  
  
  sort_by = ( in_data_attr ) ->
    console.log "> sort_by @ proc_graph.coffee -- #{in_data_attr}"
    
    me = ($ this)
  
  
  grow_procedure = ->
    console.log "> grow_procedure @ proc_graph.coffee --"
    
    $me = ($ this)
    $proc_detail = $me.find '.procedure_dialog_detail'
    proc_id = $proc_detail.closest( '.procedure_block' ).attr 'id'
    $proc_detail.data 'origin-id', proc_id
    ($ '.dialog').prepend $proc_detail
    ($ '.dialog_layer').removeClass 'prepared'
  
  
  shrink_procedure = ->
    console.log "> shrink_procedure @ proc_graph.coffee --"
    
    $me = ($ this)
    $me.addClass 'prepared'
    
    $proc_detail = $me.find '.procedure_dialog_detail'
    proc_id = $proc_detail.data 'origin-id'
    ($ "##{proc_id}").append $proc_detail
  
  
  click_selector = ->
    console.log "> click_selector @ proc_graph.coffee --"
    
    $me = ($ this)
    sel_key = $me.data 'sel-key'
    sel_id = String( $me.data 'sel-id' )
    
    unless $me.hasClass 'selected'
      $me.addClass 'selected'
      
      $procedures = ($ '.procedure_block')
      $procedures.each ( i, e ) ->
        $proc = ($ e)
        
        the_ids = get_data_array $proc, sel_key
        #console.log "-- the_ids:#{the_ids}"
        if the_ids.includes sel_id
          #console.log "-- proc:#{$proc.attr 'id'}"
          
        else
          #console.log "-- not included:#{sel_id}"
          dim_key = "#{sel_key}_#{sel_id}"
          dim_ids = get_data_array $proc, 'dimmer'
          
          unless dim_ids.includes dim_key
            dim_ids.push dim_key 
            $proc.data 'dimmer', dim_ids.join( ' ' )
          
          $proc.addClass 'dimmed' unless $proc.hasClass 'dimmed'
        
      
    else
      $me.removeClass 'selected'
      
      $procedures = ($ ".procedure_block.dimmed")
      $procedures.each ( i, e ) ->
        $proc = ($ e)
        
        dim_key = "#{sel_key}_#{sel_id}"
        dim_ids = get_data_array $proc, 'dimmer'
        #console.log "-- dim_ids:#{dim_ids.join ' '}"
        
        if dim_ids.includes dim_key
          #console.log "-- not included:#{dim_key}"
          dim_ids.splice dim_ids.indexOf( dim_key ), 1
          
          if dim_ids.length < 1
            $proc.data 'dimmer', ''
            $proc.removeClass 'dimmed'
            
          else
            $proc.data 'dimmer', dim_ids.join( ' ' )
          
        
      
    
  
  
  get_data_array = ( $in_ob, in_key ) ->
    data = $in_ob.data in_key
    return [] if data is undefined or data.length is 0
    return String( data ).split ' '
  
  
  # --- Initialization -------------------------
  
  $graph = ($ '.procedures_graph')
  unless $graph.data 'init_procedure_graph'
    console.log '-- init'
    $graph.on 'click.procedure_graph',
          '.procedure_block',
          grow_procedure
    $graph.data 'init_procedure_graph', true
  
  $dialog_layer = ($ '.dialog_layer.procedure_graph')
  unless $dialog_layer.data 'init_procedure_graph'
    console.log '-- init'
    $dialog_layer.on 'click.procedure_graph',
          shrink_procedure
    $dialog_layer.data 'init_procedure_graph', true
  
  $selector_lists = ($ '.selector_list')
  unless $selector_lists.data 'init_procedure_graph'
    console.log '-- init'
    $selector_lists.on 'click.procedure_graph',
          'li.selector',
          click_selector
    $selector_lists.data 'init_procedure_graph', true
  
  $search_block =($ '.search_block')
  unless $search_block.data 'init_procedure_graph'
    console.log '-- init'
    $search_block.on 'input.procedure_graph',
          'input[type=search]',
          search_input
    $search_block.data 'init_procedure_graph', true
  

