var ready;
ready = function() {

  $("tr[data-link]").click(function() {
		window.location = this.dataset.link
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);