module ApplicationHelper
  
  def h_partial_init( in_wert, in_default )
    return in_wert unless in_wert.nil?
    return in_default
  end
  
  def h_markdown( in_text )
    markdowner = Redcarpet::Markdown.new( Redcarpet::Render::HTML,
          no_intra_emphasis: true,
          fenced_code_blocks: true,
          disable_indented_code_blocks: true,
          autolink: true,
          tables: true,
          underline: true,
          highlight: true )
    in_text ||= ''
    markdowner.render( sanitize( in_text ) ).html_safe
  end
  
  def h_markdown_strip( in_text, in_length )
    truncate( strip_tags( h_markdown( in_text ) ), length: in_length )
  end
  
  def h_mail_link( in_text, in_entity )
    link_to( in_text,
        mail_link(
            subject: "Mitwirkung: #{truncate in_entity.title, length: 80}",
            body: "Hallo%2C%0A%0Aes gibt ein Pro-Contra-Mitwirkungsforum zu folgendem Vorhaben:%0A%0A#{in_entity.title.upcase}%0A%0AHier kannst du daran mitwirken:%0A#{procedure_url in_entity}%0A%0A%0AViele Grüsse" ) )
  end
  def mail_link( in_options )
    result = 'mailto:'
    result += in_options[ :to ] if in_options[ :to ]
    result += '?'
    result += "subject=#{in_options[ :subject ]}"
    result += "&body=#{in_options[ :body ]}" if in_options[ :body ]
    return result
  end
  
  def h_actions_target
    @is_export ? '_blank' : nil
  end
  
  # --- Title Bar methods ----------------------
  
  def h_titlebar_icon_path( in_path = nil )
    if in_path
      @titlebar_icon_path = in_path
    else
      return @titlebar_icon_path || root_path
    end
  end
  
  def h_titlebar_icon_text( in_text = nil )
    if in_text
      @titlebar_icon_text = in_text
      logger.debug "-- @titlebar_icon_text:#{@titlebar_icon_text}"
    else
      return @titlebar_icon_text || 'Startseite'
    end
  end
  
  def h_titlebar_icon( in_icon = nil, in_path = nil, in_text = nil )
    h_titlebar_icon_path( in_path ) if in_path
    h_titlebar_icon_text( in_text ) if in_text
    
    if in_icon
      case in_icon
        when 'back_arrow'
          h_titlebar_icon_text( '' ) unless in_text
          @titlebar_icon = 'sym/angle_left_w100.svg'
        else
          @titlebar_icon = in_icon
      end
    else
      return @titlebar_icon || 'logo_gremien_q96.jpg'
    end
  end
  
  def h_titlebar_text( in_title = nil )
    if in_title
      @titlebar_text = in_title
    else
      return @titlebar_text || 'Startseite'
    end
  end
  
  def h_titlebar_export( in_text = nil )
    if in_text
      @titlebar_export = in_text
    else
      return @titlebar_export || nil
    end
  end
  
  
  # --- Visitor Methods ------------------------
  
  def h_visitor_confirmed?
    return false unless current_visitor?
    current_visitor.confirmed?
  end
  
  def h_logged_in?
    return true if !current_account.blank?
    h_visitor_has_email?
  end
  
  def h_visitor_has_email?
    return false unless current_visitor?
    current_visitor.has_email?
  end
  
  def h_visitor_has_data?
    return false unless current_visitor?
    current_visitor.has_content?
  end
  
  def h_visitor_has?( in_entities )
    return false unless current_visitor?
    current_visitor.public_send( in_entities ).count > 0
  end
  
  def h_visitor_saw?( in_dialog )
    return false unless current_visitor?
    current_visitor.saw? in_dialog
  end
  
  # --- OpenGraph Definitions -----------------
  
  def h_og_type
    @og_type || 'summary'
  end
  
  def h_og_title
    @og_title || "#{params[ :action ]} @ #{params[ :controller ]}"
  end
  
  def h_og_description
    @og_description || 'Die Plattform TeiltMit erlaubt jedem Menschen, ein eigenes Mitwirkungsforum  zu konkreten Vorhaben oder Themen zu eröffnen. Die einfache Pro-Contra-Struktur und Crowd-Moderation hilft bei der sachlichen Diskussion.'
  end
  
  def h_og_image
    @og_image || image_url( 'Skizze_Forum_1200.jpg' )
  end
  
  # --- Setter
  
  def h_type( in_type )
    @og_type = in_type
  end
  
  def h_title( in_title )
    @og_title = in_title
  end
  
  def h_description( in_description )
    @og_description = in_description
  end
  
  def h_image( in_image )
    @og_image = in_image
  end
  
end
