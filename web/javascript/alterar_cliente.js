$('#ModalAlterarCliente').on('show.bs.modal', function (event) {
                      var button = $(event.relatedTarget); // Button that triggered the modal
                      var recipient = button.data('whatever'); // Extract info from data-* attributes
                      var recipientnome = button.data('whatevernome');
                      var recipientemail = button.data('whateveremail');
                      var recipientcelular  = button.data('whatevercelular');
                      var recipientCpf = button.data('whatevercpf');
                      var recipientData_nascimento = button.data('whateverdata_nascimento');
                        
                      // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                      // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                      var modal = $(this);
                      modal.find('.modal-title').text('ID ' + recipient);
                      modal.find('#id').val(recipient);
                      modal.find('#nome').val(recipientnome);
                      modal.find('#email').val(recipientemail);
                      modal.find('#celular').val(recipientcelular);
                      modal.find('#cpf').val(recipientCpf);
                      modal.find('#data_nascimento').val(recipientData_nascimento);
    });


