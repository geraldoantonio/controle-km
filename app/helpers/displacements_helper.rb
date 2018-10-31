module DisplacementsHelper

  def velocity_km(velocity)  
    unless velocity.nil? || velocity.blank?
      if velocity > 100
        "<span class='text-danger'> #{velocity.to_s << ' Km/h'} </span>".html_safe 
      else
        velocity.to_s << ' Km/h'
      end
    end 
  end

end
