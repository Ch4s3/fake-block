 $(function() {

      // intiliaze the modal but don't show it yet
      $("#new").modal('hide');

      $('a[data-target="#new"]').click(function(event) {
          event.preventDefault();
          var myModal = $('#new');
          modalBody = myModal.find('.modal-body');
          //Set title for modal
          myModal.find('.modal-title').text('Select Capsule')
          // load content into modal
          myModal.find('.modal-body').load('#{potential_capsules_path(@learning_path)}');
          // display modal
          myModal.modal('show');
      });

  });