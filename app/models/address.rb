class Address < ApplicationRecord
  has_many :displacements

 # accepts_nested_attributes_for :displacements

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
  
end
