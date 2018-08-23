class Car < ApplicationRecord
  belongs_to :functionary
  
  validates :plate, presence: true
  validates :mark , presence: true
  validates :modelType, presence: true

  def full_car
    "#{mark} #{modelType} - #{plate}"
  end
end
