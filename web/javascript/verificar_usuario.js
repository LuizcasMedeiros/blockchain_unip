$(document).ready(function (){;
        
       $('#cliente').add('#user').on('blur submit',function(){
          var dados = $(this).serialize();
          
          
          $.ajax({
              url:'processa_user.jsp',
              type: 'POST',
              dataType: 'html',
              data: dados,
              success: function(data){
                  $('#existe').html(data).show().fadeOut( 2111 );
                
                
              }
             
          }
                
                   
                   );
          return false;
       });
});
