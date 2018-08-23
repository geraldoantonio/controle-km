class Functionary < ApplicationRecord
  has_many :cars
  accepts_nested_attributes_for :cars
  
  validates :name, presence: true
  
  enum function: [ :'Gerente de Projeto', :'Supervisor', :'Líder', :'Técnico em Informática'  ]
  
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
