class Address < ApplicationRecord
  has_many :displacements
  belongs_to :functionary

  validates :description, :address, :city, :uf, presence: true
 
  enum uf: [   
    :AC, :AL, :AM, :AP, :BA, :CE, :DF, :ES,
    :GO, :MA, :MG, :MS, :MT, :PA, :PB, :PE, 
    :PI, :PR, :RJ, :RN, :RO, :RR, :RS, :SC, 
    :SE, :SP, :TO
   ]
    
  scope :with_address, ->(current_user){
    includes(:functionary)
    .left_joins(:functionary)
    .where("functionary_id = ? OR leader = ?", current_user, current_user)
    .order('functionaries.name', :description)
  }
end
