class AddVelocityToDisplacements < ActiveRecord::Migration[5.2]
  def change
    add_column :displacements, :velocity, :float, default: 0
  end
end
