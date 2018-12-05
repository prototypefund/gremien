module InfoHelper
  
  def h_rating_info( in_rating )
    in_rating.done? ? in_rating.kind : in_rating.status
  end
  
  def h_border?( in_log )
    %w( create update answer send ).any? { |w|
          in_log.action.include? w }
  end
  
end
