class AddUserToFunctionaries < ActiveRecord::Migration[5.2]
  def change
    add_reference :functionaries, :user, foreign_key: true
  end
end
