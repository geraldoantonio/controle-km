class Car < ApplicationRecord
  belongs_to :functionary
  has_many :displacements

  validates :plate, :mark, :modelType, :km, presence: true
  validates_format_of :plate, with: /\w{3}-\d{4}/
  validates_numericality_of :km

 #scope :with_car, ->(current_user){includes(:functionary).joins("INNER JOIN functionaries ON functionaries.id = cars.functionary_id").where("functionary_id = ? OR leader = ?", current_user, current_user)}
  scope :with_car, ->(current_user){
    includes(:functionary).left_joins(:functionary)
    .where('functionary_id = ? or leader = ?', current_user, current_user)
    .order('functionaries.name')
  }
    
  def to_s_select
    to_s(:select)
  end
  

  def full_car_name    
    "#{self.mark} #{self.modelType} - #{self.plate} "
  end

  
end
