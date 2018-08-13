class AddLeaderToFunctionaries < ActiveRecord::Migration[5.2]
  def change
    add_column :functionaries, :leader, :integer
  end
end
