# --- Email into Names Fields ------------------

($ document).on 'turbolinks:load', ->
  console.log '> script @ formular_email.js'
  
  email_eingabe_timer = null
  
  email_eingabe = ( in_event ) ->
    console.log '> email_eingabe @ formular_email.js'
    if email_eingabe_timer isnt null
      window.clearTimeout email_eingabe_timer
    
    
    email_eingabe_timer = window.setTimeout analysiere_email, 500
  
  
  analysiere_email = ->
    $email_feld = ($ '.field input[type=email]')
    email = $email_feld.val()
    #console.log '-- email: ' + email
    
    splitter = ( in_splitter ) ->
      email.split( '@' )[ 0 ]
          .split( in_splitter )
    
    namen = splitter '.'
    namen = splitter '_' if splitter( '_' ).length > namen.length
    namen = splitter '-' if splitter( '-' ).length > namen.length
    
    vorname = namen[ 0 ]
    nachname = if namen.length > 1 then namen[ 1 ] else ''
    
    capitalize = ( in_text ) ->
      in_text[ 0 ].toUpperCase() + in_text.slice( 1, in_text.length )
    
    vorname = capitalize vorname
    if nachname.length > 0
      nachname = capitalize nachname
    
    #console.log "-- vorname:#{vorname} nachname:#{nachname}"
    
    untersuche = ( $in_feld ) ->
      #console.log "-- id:#{$in_feld.attr('id')}"
      if $in_feld.attr( 'id' ).includes 'first_name'
        $in_feld.val( vorname )
      if $in_feld.attr( 'id' ).includes 'last_name'
        $in_feld.val( nachname )
    
    $formfelder = $email_feld
          .closest( 'form' )
          .find 'input[type=text]'
    #console.log "-- formfelder:#{$formfelder.length}"
    untersuche ($ feld) for feld in $formfelder
  
  
  # --- Initialisierung ------------------------
  
  $main = ($ 'main')
  unless $main.data 'init_formular_email'
    console.log '-- init'
    # Initialisierung des Email-Felds
    $main.on 'input.forms',
        '.field input[type=email]',
        email_eingabe
    $main.data 'init_formular_email', true
  

