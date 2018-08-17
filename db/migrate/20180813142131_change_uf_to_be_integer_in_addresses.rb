class ChangeUfToBeIntegerInAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :uf, 'integer USING CAST(uf AS integer)'
  end
end
