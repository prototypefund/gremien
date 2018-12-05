module ArgumentsHelper
  
  def h_visitor_owns?( in_argument )
    current_visitor? and in_argument.author == current_visitor
  end
  
  def h_skip_argument_intro?
    current_visitor? and current_visitor.saw? :argument_intro
  end
  
end
