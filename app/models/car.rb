class Car < ApplicationRecord
  belongs_to :functionary
  validates :plate, :mark, :modelType, presence: true
  validates_format_of :plate, with: /\w{3}-\d{4}/

  scope :with_car, ->(user){includes(:functionary).joins("INNER JOIN functionaries ON functionaries.id = cars.functionary_id").where("functionary_id = ? OR leader = ?", user.functionary, user.functionary)}

end
