module CarsHelper

  def full_car(car)
    "#{car.mark} #{car.modelType} - Placa: #{car.plate}"
  end

  def car_functionary(car)
    "#{car.mark} #{car.modelType} - #{car.plate} - #{car.functionary.name}"
  end

end
