class ChangeUfToBeIntegerInAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :uf, :integer
  end
end
