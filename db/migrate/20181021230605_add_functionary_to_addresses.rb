class AddFunctionaryToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :functionary, foreign_key: true
  end
end
