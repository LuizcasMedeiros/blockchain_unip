$(document).ready(function(){
    $('#data_nascimento').on('blur', function(){

	// Pega o valor do input
	var dataNascimentodoUsuario = document.querySelector("#data_nascimento").value;
        console.log(dataNascimentodoUsuario)

	// Data de hoje
	const dataAtual = new Date(); 

	// Data de nascimento do usuário
	const dataNascimento = new Date(dataNascimentodoUsuario); 

	// Subtrai uma data pela outra
	const diff = Math.abs(dataAtual.getTime() - dataNascimento.getTime()); 

	// Divide o total pelo total de milisegundos correspondentes a 1 ano. 
	const anos = Math.ceil(diff / (1000 * 60 * 60 * 24 * 365));

	// Compara se o usuário tem mais de 18 anos
	if(anos < 18){
		// Adiciona a classe cpfresponsavel 
              document.getElementById('cpf_responsavell').classList.toggle('cpfresponsavel');
	      document.getElementById('cpf_responsavel').required = true;
              } 

	
        
        
    })  
})


