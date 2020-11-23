$(document).ready(function (){
        
       $('#user').on('blur',function(){
          var dados = $(this).serialize();
          
          
          $.ajax({
              url:'processa_user.jsp',
              type: 'POST',
              dataType: 'html',
              data: dados,
              success: function(data){
                  $('#existe').html(data).show().fadeOut( 2111 );
                  if(data.trim() === '<p style="color:red"><small>Usuario Indisponivel!</small></p>'){
                      $("input[name='user']").val('').focus();
                  }
                
                
              }
             
          }
                
                   
                   );
         
       });
});
