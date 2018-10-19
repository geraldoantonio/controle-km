class ChangeUfToBeIntegerInAddresses < ActiveRecord::Migration[5.2]
  def change
    if Rails.env.production?
      change_column :addresses, :uf, 'integer USING CAST(uf AS integer)'    
    else  
      change_column :addresses, :uf, :integer
    end
  end
end
