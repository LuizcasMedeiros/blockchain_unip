$(document).ready(function (){
    
   
   $('#pesquisaClientecf').add('#pesquisacf').keyup(function(){
       
       $('#pesquisaTopBarCf').add('#pesquisaDropdowncF').submit(function(){
          var dados = $(this).serialize();
          
          
          $.ajax({
              url:'processa_pesquisa_cliente.jsp',
              type: 'POST',
              dataType: 'html',
              data: dados,
              success: function(data){
                  $('#resultado').html(data);
                  
              
              }
          });
          return false;
       });
       
       
   });  
});
