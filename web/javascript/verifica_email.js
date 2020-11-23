$(document).ready(function (){;
        
       $('#email').on('blur',function(){
          var dados = $(this).serialize();
          
          
          $.ajax({
              url:'processa_email.jsp',
              type: 'POST',
              dataType: 'html',
              data: dados,
              success: function(data){
                  $('#existe').html(data).show().fadeOut( 2111 );
                  console.log(data.trim())
                  if(data.trim() === '<p style="color:red"><small>Email já cadastrado!</small></p>'){
                      $("input[name='email']").val('').focus();
                  }
                
                }
             
            } 
                
                   
            );
          
       });
});
