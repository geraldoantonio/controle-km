module ApplicationHelper

  def active_icon(actived)
    if actived == true
      "<i class=\"fas fa-lg fa-toggle-on\"></i>"
    else      
      "<i class=\"fas fa-lg fa-toggle-off\"></i>"
    end
  end


end
