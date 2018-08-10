class CreateDisplacements < ActiveRecord::Migration[5.2]
  def change
    create_table :displacements do |t|
      t.references :car, foreign_key: true
      t.references :functionary, foreign_key: true
      t.date :dateDay
      t.integer :osNumber
      t.integer :osProject
      t.time :startHour
      t.time :endHour
      
      t.references :addressSrc, index: true, foreign_key: { to_table: :addresses }
      t.references :addressDst, index: true, foreign_key: { to_table: :addresses }

      
      t.integer :kmStart
      t.integer :kmEnd
      t.integer :kmCount
      t.text :annotation

      t.timestamps
    end
  end
end
