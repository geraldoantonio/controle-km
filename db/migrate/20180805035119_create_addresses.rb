class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :description
      t.string :cep
      t.string :address
      t.string :city
      t.string :uf

      t.timestamps
    end
  end
end
