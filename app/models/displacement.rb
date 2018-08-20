class Displacement < ApplicationRecord
  belongs_to :car
  belongs_to :functionary
  belongs_to :addressSrc, class_name: "Address"
  belongs_to :addressDst, class_name: "Address"
  
  
  validates :kmStart, presence: true
  validates :startHour, presence: true
  
  validate :km_end_start, :addressEqual
  
  
  before_save :set_km_count
  
  enum osProject: [ :SOLUTIS, :SEFAZ, :SEC, :TJBA, :EBAL  ]
  
  filterrific(
   default_filter_params: { sorted_by: 'dateDay_desc' },
   available_filters: [
     :sorted_by,      
     :with_dateDay_gte,
     :with_dateDay_lt,
   ]
  )
 # define ActiveRecord scopes for
 # :search_query, :sorted_by, :with_country_id, and :with_created_at_gte
  
  
  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s      
    when /^id_/
      order("displacements.id #{ direction }")
    when /^dateDay_/
      order("displacements.\"dateDay\" #{ direction }","displacements.\"startHour\" desc")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }
  
  scope :with_dateDay_gte,lambda { |reference_time|
    where('displacements."dateDay" >= ?', reference_time)
  }

  scope :with_dateDay_lt,lambda { |reference_time|
    where('displacements."dateDay" <= ?', reference_time)
  }
  
 
  def self.options_for_sorted_by
    [
      ['Id', 'id_desc'],
      ['Data', 'dateDay_desc']
    ]
  end
  
  def addressEqual    
    if self.addressSrc == self.addressDst      
      errors.add(:base, "Endereço de Origem não pode ser igual ao de Destino !")
    end    
  end
  
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
