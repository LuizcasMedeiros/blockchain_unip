$('#ModalAlterarInvestimento').on('show.bs.modal', function (event) {
                      var button = $(event.relatedTarget); // Button that triggered the modal
                      var recipient = button.data('whatever'); // Extract info from data-* attributes
                      var recipientdata = button.data('whateverdata');
                      var recipienttempo = button.data('whateverhora');
                      // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                      // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                      var modal = $(this);
                      modal.find('.modal-title').text('ID ' + recipient);
                      modal.find('#id').val(recipient);
                      modal.find('#data').val(recipientdata);
                      modal.find('#hora').val(recipienttempo);
    });


