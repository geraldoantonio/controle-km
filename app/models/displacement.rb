class Displacement < ApplicationRecord
  belongs_to :car
  belongs_to :functionary
  belongs_to :addressSrc, class_name: "Address"
  belongs_to :addressDst, class_name: "Address"
  
  validates :car_id, :functionary_id, :dateDay, :osNumber,
            :osProject, :startHour, :addressSrc_id,
            :addressDst_id, :kmStart, presence: true
  
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
  
 
  def total_blank?    
     self.kmEnd.blank? || self.kmEnd.nil? || self.endHour.blank? || self.endHour.nil?
  end

  scope :with_displacement, ->(user){includes(:functionary,:addressDst).joins("INNER JOIN functionaries ON functionaries.id = displacements.functionary_id").where("functionary_id = ? OR leader = ?", user.functionary, user.functionary)}
  
end
