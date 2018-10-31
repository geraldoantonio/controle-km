class AddKmToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :km, :integer, default: 0
  end
end
