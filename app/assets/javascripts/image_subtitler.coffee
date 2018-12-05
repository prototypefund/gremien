# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
# ----------------------------------------------

($ document).on 'turbolinks:load', ->
  console.log '> script @ image_subtitler.js'
  
  subtitle_images = ( in_node ) ->
    in_node
      .find 'img'
      .each ->
        $image = ($ this)
        console.log "-- subtitle_images -- alt:#{$image.prop 'alt'} @ image_subtitler.js"
        $image_container = image.closest 'p'
        $image_container.addClass 'image_container'
        
        subtitle = image.attr 'title'
        if subtitle?.length > 0
          subtitle_tag = ($ '<div>')
          subtitle_tag.addClass 'subtitle'
          subtitle_tag.html subtitle
          $image.after subtitle_tag
        
      
    
  
  
  # --- Initialisierung ------------------------
  
  ($ '.markdown_content').each ->
    subtitle_images ($ this)
  

