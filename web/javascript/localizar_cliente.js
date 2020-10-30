$(document).ready(function (){;
    
   
   $('#pesquisaCliente').keyup(function(){
       
       $('#pesquisa').submit(function(){
          var dados = $(this).serialize();
          
          
          $.ajax({
              url:'processa_pesquisa.jsp',
              type: 'POST',
              dataType: 'html',
              data: dados,
              success: function(data){
                  $('#resultado').html(data);
                  
              
              }
          });
          return false;
       });
       
       $('#pesquisa').trigger('submit');
       
   });  
});
