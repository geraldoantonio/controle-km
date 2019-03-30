function getLastKm(){  
  var car_id = $("#displacement_car_id option:selected").val();

  if (car_id == null){
    toastr['warning']('Selecione um carro antes de pesquisar última quilometragem!');
  } else {    
    toastr['success']('Pesquisando última quilometragem!');
    $.ajax({
      type:"GET",
      url:"/cars/" + car_id,
      dataType:"json",
      success:function(result){
        $("#displacement_kmStart").val(result.km); 
        $("#displacement_kmEnd").attr('min', result.km).val(0);
      }
    })
  }
}

$(document).ready(function(){  

  $('#displacement_car_id').change(function(){
    getLastKm();
  });
  
  $("#displacement_kmStart").change(function(){
    $("#displacement_kmEnd").attr('min', $("#displacement_kmStart").val() );
  }); 

});

