jQuery ->
  $('#search').autocomplete
    source: "/searches"
  $(".ui-helper-hidden-accessible").hide()