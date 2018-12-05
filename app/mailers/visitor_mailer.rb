class VisitorMailer < ApplicationMailer
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.visitor_mailer.update.subject
  #
  def update( in_visitor )
    @greeting = [ 'Hallo', in_visitor.name ].compact.join( ' ' ) + ','
    @follows = in_visitor.follows
    
    mail to: in_visitor.email,
          subject: "[TeiltMit] Es gibt etwas Neues..."
    
    # reset last sent date
    @follows.each do |follow|
      follow.last_sent_at = Time.zone.now
      follow.status = 'ready'
      follow.save!
    end
  end
  
  def confirmation( in_visitor )
    @greeting = [ 'Hallo', in_visitor.name ].compact.join( ' ' ) + ','
    @visitor = in_visitor
    @confirm_url = confirm_visitor_url( in_visitor, ato: in_visitor.generate_auth_token )
    
    mail to: in_visitor.email,
          subject: "[TeiltMit] Bitte bestätigen!"
  end
  
  def login_link( in_visitor )
    @greeting = [ 'Hallo', in_visitor.name ].compact.join( ' ' ) + ','
    @login_url = login_visitor_url( in_visitor, ato: in_visitor.generate_auth_token )
    
    mail to: in_visitor.email,
          subject: "[TeiltMit] Ihr Login Link"
  end
  
  def entity_notification( in_entity )
    case
      when in_entity.is_a?( Argument )
        @parent = in_entity.procedure
        @receiver = @parent.owner.visitor
        @reference_label = 'Vorhaben'
        @reference_title = @parent.title
        @entity_label = 'ein neues Argument'
        
      when in_entity.is_a?( Comment )
        @parent = in_entity.argument
        @receiver = @parent.author
        @reference_label = 'Argument'
        @reference_title = @parent.title
        @entity_label = 'einen neuen Kommentar'
    end
    
    @entity_text = in_entity.title
    @entity_url = url_for in_entity
    
    @greeting = [ 'Hallo', @receiver.name ].compact.join( ' ' ) + ','
    
    mail to: @receiver.email,
          subject: "[TeiltMit] Es gibt " + @entity_label
  end
  
  def moderation_request( in_rating )
    if !in_rating.is_a?( Rating ) or
          in_rating.new_record? or
          in_rating.entity.published?
      Log.create! action: 'error mod request',
            comment: in_rating.to_yaml,
            entity: in_rating
      return false
    end
    
    @visitor = in_rating.visitor
    @entity = in_rating.entity
    @greeting = [ 'Hallo', @visitor.name ].compact.join( ' ' ) + ','
    
    @frequent_rater = @visitor.frequent_rater?
    @required_ratings = @entity.procedure.required_ratings
    
    base_url = answer_rating_url( in_rating ) + '?h='
    @context_url = url_for @entity
    @relay_url = base_url + in_rating.id_hash( 'relay' )
    @offensive_url = base_url + in_rating.id_hash( 'abusive' )
    @improve_url = base_url + in_rating.id_hash( 'improve' )
    @accept_url = base_url + in_rating.id_hash( 'accept' )
    
    case
      when in_rating.entity.is_a?( Argument )
        moderation_request_argument in_rating
      when in_rating.entity.is_a?( Comment )
        moderation_request_comment in_rating
    end
  end
  
  def moderation_request_argument( in_rating )
    @reference_title = @entity.procedure.title
    @contribution_kind = case
      when @entity.kind == 'info' then 'Information'
      else "#{@entity.kind.upcase}-Argument"
    end
    @entity_title = @entity.title
    @entity_description = @entity.description
    @entity_description = '- keine Beschreibung -' if @entity_description.blank?
    
    mail to: @visitor.email,
          subject: "[TeiltMit] Prüfe neues Argument, bitte!",
          template_name: 'moderation_request_argument'
  end
  
  def moderation_request_comment( in_rating )
    @reference_kind = "#{entity.argument.kind.upcase}-Argument"
    @reference_title = entity.argument.title
    @entity_description = entity.content
    
    @entity_description = entity.description
    @entity_description = '- keine Beschreibung -' if @entity_description.blank?
    
    mail to: @visitor.email,
          subject: "[TeiltMit] Prüfe neuen Kommentar, bitte!",
          template_name: 'moderation_request_comment'
  end
  
  def moderation_result( in_entity )
    author = in_entity.author
    @entity = in_entity
    @greeting = [ 'Hallo', author.name ].compact.join( ' ' ) + ','
    
    @contribution_text = case
      when @entity.is_a?( Argument )
        'dein neues Argument'
      when @entity.is_a?( Comment )
        'deinen neuer Kommentar'
      else
        'deinen neuen Beitrag'
    end
    
    @contribution_url = full_url_for @entity
    
    mail to: author.email,
          subject: "[TeiltMit] Bewertung Ihres Beitrags"
  end
  
  def vote_link( in_receipt)
    logger.debug "> vote_link @ visitor_mailer -- in_receipt:#{in_receipt.to_yaml}"
    procedure = in_receipt.procedure
    visitor = in_receipt.visitor
    
    @greeting = [ 'Hallo', visitor.name ].compact.join( ' ' ) + ','
    @procedure_title = procedure.title.upcase
    @receipt_url = answer_receipt_url( in_receipt, ato: in_receipt.generate_auth_token )
    
    mail to: visitor.email,
          subject: "[TeiltMit] Ihr Link zum Abstimmen!"
  end
  
end
