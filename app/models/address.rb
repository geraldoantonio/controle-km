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
    
  scope :with_address, ->(user){includes(:functionary).joins("INNER JOIN functionaries ON functionaries.id = addresses.functionary_id").where("functionary_id = ? OR leader = ?", user.functionary, user.functionary).order(:description)}
end
