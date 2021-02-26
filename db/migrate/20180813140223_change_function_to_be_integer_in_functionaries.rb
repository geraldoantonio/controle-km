class ChangeFunctionToBeIntegerInFunctionaries < ActiveRecord::Migration[5.2]
  def change
    change_column :functionaries, :function, 'integer USING CAST(function AS integer)'
  end
end
