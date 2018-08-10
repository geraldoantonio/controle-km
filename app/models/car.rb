class Car < ApplicationRecord
  belongs_to :functionary

  def full_car
    "#{mark} #{modelType} - #{plate}"
  end
end
