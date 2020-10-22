function excluir (nome, id){
   if(confirm("Tem certeza que deseja excluir o Cliente: " + nome + " com o ID "+id+"?")){
        window.open("excluir_cliente.do?id=" + id, "_self");
   };
}
      