class Address < ApplicationRecord
  has_many :displacements
  belongs_to :functionary

  validates :description, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :uf, presence: true
 
  enum uf: [   
    :AC, :AL, :AM, :AP, :BA, :CE, :DF, :ES,
    :GO, :MA, :MG, :MS, :MT, :PA, :PB, :PE, 
    :PI, :PR, :RJ, :RN, :RO, :RR, :RS, :SC, 
    :SE, :SP, :TO
   ]
  
  def full_address
    "(#{self.description}) #{self.address}, #{self.city} - #{self.uf}, #{self.cep}"
  end  
  def latitude
    self.geolocalization.split(",")[0]
  end
  def longitude    
    self.geolocalization.split(",")[1]
  end
  
  
  scope :with_address, ->(user){includes(:functionary).joins("INNER JOIN functionaries ON functionaries.id = addresses.functionary_id").where("functionary_id = ? OR leader = ?", user.functionary, user.functionary)}

end
