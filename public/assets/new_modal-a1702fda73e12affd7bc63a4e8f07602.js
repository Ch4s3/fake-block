$(function(){$("#new").modal("hide"),$('a[data-target="#new"]').click(function(a){a.preventDefault();var e=$("#new");modalBody=e.find(".modal-body"),e.find(".modal-title").text("Select Capsule"),e.find(".modal-body").load("#{potential_capsules_path(@learning_path)}"),e.modal("show")})});