module BodiesHelper
  
  def h_new_procedure_path
    if @body
      new_body_procedure_path( @body )
    else
      new_procedure_path
    end
  end
  
  def h_body_procedures_for_account( in_body )
    result = []
    result |= in_body.procedures.owned_by?( current_account ).sorted if current_account
    result |= in_body.procedures.opened.published.sorted
    return result
  end
  
  def h_body_selected_class( in_body )
    @body == in_body ? 'selected' : nil
  end
  
end
