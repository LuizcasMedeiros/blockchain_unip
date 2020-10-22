function validar(){
   senha = document.getElementById('senha').value;
   csenha = document.getElementById('confirmarSenha').value;
   email = document.getElementById('email').value;
   cemail = document.getElementById('cemail').value;
   
   if (senha !== csenha) {
      alert("SENHAS DIFERENTES!\nFAVOR DIGITAR SENHAS IGUAIS"); 
      return false;
   }else if(email !== cemail){
      alert("EMAILS DIFERENTES!\nFAVOR DIGITAR EMAILS IGUAIS"); 
      return false;
   }else {
      return true; 
   }
}


