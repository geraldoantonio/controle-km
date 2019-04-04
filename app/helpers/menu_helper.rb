module MenuHelper

  def active_menu?(controller_name)
    return ' active' if current_page?(controller: controller_name )
    ''
  end

end