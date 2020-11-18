$('#ModalAlterarFuncionario').on('show.bs.modal', function (event) {
                      var button = $(event.relatedTarget); // Button that triggered the modal
                      var recipient = button.data('whatever'); // Extract info from data-* attributes
                      var recipientnome = button.data('whatevernome');
                      var recipientrg= button.data('whateverrg');
                      var recipientcelular  = button.data('whatevercelular');
                      var recipientCpf = button.data('whatevercpf');
                      var recipientData_nascimento = button.data('whateverdata_nascimento');
                      var recipientedata_admissao = button.data('whateverdata_admissao');
                      var recipientecargo = button.data('whatevercargo');
                      var recipientesetor = button.data('whateversetor');
                      var recipientectps = button.data('whateverctps');
                      var recipientepis = button.data('whateverpis');
                      
                     
                      
                      
                      
                     

 
                                                          
                        
                      // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                      // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                      var modal = $(this);
                      modal.find('.modal-title').text('MATRICULA' + recipient);
                      modal.find('#matricula').val(recipient);
                      modal.find('#nome').val(recipientnome);
                      modal.find('#celular').val(recipientcelular);
                      modal.find('#cpf').val(recipientCpf);
                      modal.find('#data_nascimento').val(recipientData_nascimento);
                      modal.find('#data_admissao').val(recipientedata_admissao);
                      modal.find('#cargo').val(recipientecargo);
                      modal.find('#setor').val(recipientesetor);
                      modal.find('#ctps').val(recipientectps);
                      modal.find('#pis').val(recipientepis);
                      modal.find('#rg').val(recipientrg);
                      
                    
                      
                    
                      
                     
                      
    });


