$(document).ready(function () {
    $('#cnpjcheck').on('change', function () { 
       
        if (this.checked){
         document.getElementById('cnpj_div_id').classList.toggle('cnpj_div');
         document.getElementById('cnpj').required = true;  
            
        }else if(!this.checked){
           document.getElementById('cnpj_div_id').classList.toggle('cnpj_div'); 
           document.getElementById('cnpj').required = false;  
        }
    });

});





