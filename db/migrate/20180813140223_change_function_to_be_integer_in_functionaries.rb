class ChangeFunctionToBeIntegerInFunctionaries < ActiveRecord::Migration[5.2]
  def change
      #change_column :table_name, :column_name, :new_type
      if Rails.env.production?
        change_column :functionaries, :function, 'integer USING CAST(function AS integer)'
      else
        change_column :functionaries, :function, :integer 
      end
  end
end
