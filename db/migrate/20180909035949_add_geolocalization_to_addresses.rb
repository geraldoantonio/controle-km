class AddGeolocalizationToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :geolocalization, :string
  end
end
