module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?
    
    messages = resource.errors.full_messages.map { |msg| 
      javascript_tag "toastr['info']('#{msg}')"
    }.join    
    
    messages.html_safe
    
  end

  def devise_error_messages? 
    return false
    !resource.errors.empty? || !resource.errors.nil?
  end

end