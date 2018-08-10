class Displacement < ApplicationRecord
  belongs_to :car
  belongs_to :functionary
  belongs_to :addressSrc, class_name: "Address"
  belongs_to :addressDst, class_name: "Address"
  
  
  validates :kmStart, presence: true
  validates :startHour, presence: true
  
  validate :km_end_start
  
  
  before_save :set_km_count
  
  enum osProject: [ :SOLUTIS, :SEFAZ, :SEC, :TJBA, :EBAL  ]
  
  
  def km_end_start    
    if km_end_less?      
      errors.add(:base, "Kilometragem final menor que inicial!")
    end    
  end
  
  def km_end_less?
    unless kmEnd.blank? || kmEnd.nil?
      kmEnd < kmStart
    end
  end
  
  def set_km_count
    unless kmEnd.blank? || kmEnd.nil? || kmStart.blank? || kmEnd.nil?
      unless km_end_less?
        self.kmCount = kmEnd - kmStart
      end
    end
  end
  
  def full_car
    "#{self.car.mark} #{self.car.modelType} - #{self.car.plate}"
  end  
  
  def full_address_src
    "(#{self.addressSrc.description}) #{self.addressSrc.address}, #{self.addressSrc.city} - #{self.addressSrc.uf}, #{self.addressSrc.cep}"
  end  
  
  def full_address_dst
    "(#{self.addressDst.description}) #{self.addressDst.address}, #{self.addressDst.city} - #{self.addressDst.uf}, #{self.addressDst.cep}"
  end
    
  
end
