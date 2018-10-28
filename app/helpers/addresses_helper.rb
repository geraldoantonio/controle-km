module AddressesHelper

  def full_address(address)
    "(#{address.description}) #{address.address}, #{address.city} - #{address.uf}, #{address.cep}"
  end  

  def latitude(geolocalization)
    geolocalization.split(",")[0]
  end

  def longitude(geolocalization)    
    geolocalization.split(",")[1]
  end

end
