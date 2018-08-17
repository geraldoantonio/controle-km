class ChangeUfToBeIntegerInAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :uf, 'integer USING CAST(column_name AS integer)'
  end
end
