class CreateFunctionaries < ActiveRecord::Migration[5.2]
  def change
    create_table :functionaries do |t|
      t.string :matriculation
      t.string :name
      t.string :function
      t.boolean :active

      t.timestamps
    end
  end
end
