ready = ->
  $('#quizzesTable').dataTable()

$(document).ready(ready)
$(document).on('page:load', ready)

