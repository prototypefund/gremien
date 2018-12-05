module ProceduresHelper
  
  def h_editable?( in_procedure )
    #logger.debug "-- current_account:#{current_account}"
    current_account and in_procedure.editable_by? current_account
  end
  
  def h_for_body?( in_procedure )
    in_procedure.body.id != 1
  end
  
  def h_faved?( in_entity )
    current_visitor? and in_entity.faved_by?( current_visitor ) and in_entity.fav_for( current_visitor ).up?
  end
  def h_dissed?( in_entity )
    current_visitor? and in_entity.faved_by?( current_visitor ) and in_entity.fav_for( current_visitor ).down?
  end
  
  def h_followed?( in_entity )
    current_visitor? and in_entity.followed_by? current_visitor
  end
  
  def h_args( in_procedure, in_kind = 'info' )
    args_kind = in_procedure.arguments.send( in_kind )
    result = []
    result |= args_kind.owned_by?( current_visitor ) if current_visitor?
    result |= args_kind.rate_by?( current_visitor ) if current_visitor?
    
    result |= args_kind.published
    result |= args_kind.moderating.select { |a| a.accepted? }
    
    result.sort_by! { |a| a.favs_sum }
        .reverse!
    return result
  end
  
  def h_comments( in_comments )
    result = []
    result |= in_comments.owned_by?( current_visitor ) if current_visitor?
    result |= in_comments.rate_by?( current_visitor ) if current_visitor?
    
    result |= in_comments.published
    result |= in_comments.moderating.select { |c| c.accepted? }
    
    result.sort_by! { |c| c.favs_sum }
        .reverse!
    return result
  end
  
end
