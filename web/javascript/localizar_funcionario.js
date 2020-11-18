$(document).ready(function (){;
    
   
   $('#pesquisaCliente').add('#pesquisa').keyup(function(){
       
       $('#pesquisaTopBar').add('#pesquisaDropdown').submit(function(){
          var dados = $(this).serialize();
          
          
          $.ajax({
              url:'processa_pesquisa_funcionario.jsp',
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
