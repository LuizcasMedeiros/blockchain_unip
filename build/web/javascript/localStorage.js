if(localStorage.nome){

}





var salvarDados = function (){
   var nome = document.getElementById('nome').value;
   var cpf =  document.getElementById('cpf').value;
   var celular =  document.getElementById("celular").value;
   var email = document.getElementById("email").value;
   var data_nascimento = document.getElementById("data_nascimento").value; 
   var user = document.getElementById("user").value;
   var senha = document.getElementById("senha").value;
   localStorage.setItem('nome', nome);
   localStorage.setItem('cpf', cpf);
   localStorage.setItem('celular', celular);
   localStorage.setItem('email', email);
   localStorage.setItem('data_nascimento', data_nascimento);
   localStorage.setItem('user', user);
   
}

document.onchange = salvarDados;