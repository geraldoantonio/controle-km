class Functionary < ApplicationRecord

  has_many :cars
  belongs_to :user, inverse_of: :functionary, optional: true
  accepts_nested_attributes_for :user, reject_if: :all_blank
  
  validates :name, :matriculation, :function, 
            :leader,  presence: true

  enum function: [ :leader, :tecnical  ]
  
  def leader_name(functionary)
    Functionary.find(functionary).name 
  end
  
  def active_icon(active)
    if active == true
      "<i class=\"fas fa-lg fa-toggle-on\"></i>"
    else      
      "<i class=\"fas fa-lg fa-toggle-off\"></i>"
    end
  end


end
