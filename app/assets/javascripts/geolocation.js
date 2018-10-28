function getLocation(){
  if (navigator.geolocation){
    toastr['success']('Buscando localização, aguarde um instante...');
    navigator.geolocation.getCurrentPosition(showPosition,showError);
  }else{
    toastr['error']('Seu browser não suporta Geolocalização.');
  }
}

function showPosition(position){   
  document.getElementById("address_geolocalization").value = position.coords.latitude +","+ position.coords.longitude;
  geocode_reverse(position.coords.latitude, position.coords.longitude);
  toastr['success']('Buscando endereço, aguarde mais um instante...');
}

function showError(error){
  switch(error.code){
    case error.PERMISSION_DENIED:
      toastr['error']('Usuário rejeitou a solicitação de Geolocalização.');
      break;
    case error.POSITION_UNAVAILABLE:
      toastr['error']('Localização indisponível.');
      break;
    case error.TIMEOUT:
      toastr['error']('A requisição expirou.');
      break;
    case error.UNKNOWN_ERROR:
      toastr['error']('Algum erro desconhecido aconteceu.');
      break;
  }
}

function geocode_reverse(latitude, longitude){
  var request = new XMLHttpRequest();

  request.open('GET', 'https://api.openrouteservice.org/geocode/reverse?api_key=5b3ce3597851110001cf62486a7eb94a0f6145d0bbbee11d66f9b170&point.lat='+latitude+'&point.lon='+longitude+'&size=1&layers=address,county,region,locality&boundary.country=BRA');

  request.onreadystatechange = function () {
    if (this.readyState === 4) {
      //console.log('Status:', this.status);
     // console.log('Headers:', this.getAllResponseHeaders());
     // console.log('Body:', this.responseText);
      address_include(this.responseText);
    }
  };

  request.send();
}

function address_include(data){
  var obj = JSON.parse(data);
  address = obj.features[0].properties;

  document.getElementById("address_description").value = address.label;
  document.getElementById("address_cep").value = address.postalcode;
  document.getElementById("address_address").value = address.street+", Nº "+address.housenumber;
  document.getElementById("address_city").value = address.locality;
  document.getElementById("address_uf").value = address.region_a;

}



function initMap() {

  var addressSrc = document.getElementById("srcLocal").innerHTML 
  var addressDst = document.getElementById("dstLocal").innerHTML 

  var directionsService = new google.maps.DirectionsService;
  var directionsDisplay = new google.maps.DirectionsRenderer;
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 8,
    center: self.addressSrc
  });
  directionsDisplay.setMap(map);

  calculateAndDisplayRoute(directionsService, directionsDisplay, addressSrc, addressDst);
}

function calculateAndDisplayRoute(directionsService, directionsDisplay, addressSrc, addressDst) {
  
  directionsService.route({
    origin: addressSrc,
    destination: addressDst,
    travelMode: 'DRIVING'
  }, function(response, status) {
    if (status === 'OK') {
      directionsDisplay.setDirections(response);
    } else {
      toastr['error']('Falha ao obter direção: ' + status);
    }
  });
}