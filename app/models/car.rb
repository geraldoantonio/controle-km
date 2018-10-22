class Car < ApplicationRecord
  belongs_to :functionary
  validates :plate, presence: true
  validates :mark , presence: true
  validates :modelType, presence: true

  def full_car
    "#{mark} #{modelType} - #{plate}"
  end

  def car_functionary
    "#{mark} #{modelType} - #{plate} - #{functionary.name}"
  end
  scope :with_car, ->(user){joins("INNER JOIN functionaries ON functionaries.id = cars.functionary_id").where("functionary_id = ? OR leader = ?", user.functionary, user.functionary)}
  
end
