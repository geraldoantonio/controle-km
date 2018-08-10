class Functionary < ApplicationRecord
  has_many :cars
  accepts_nested_attributes_for :cars
  
  def active_icon(active)
    if active == true
      "<i class=\"fas fa-lg fa-toggle-on\"></i>"
    else      
      "<i class=\"fas fa-lg fa-toggle-off\"></i>"
    end
  end
  
end
