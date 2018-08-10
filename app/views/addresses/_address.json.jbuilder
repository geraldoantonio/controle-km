json.extract! address, :id, :description, :cep, :address, :city, :uf, :created_at, :updated_at
json.url address_url(address, format: :json)
