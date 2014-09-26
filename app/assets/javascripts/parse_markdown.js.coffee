@update_markdown_test = (markdown_value, body_preview, dv_preview, lk_preview, dv_write, lk_write) ->
  mardown_value = $('#'+markdown_value).val()

  $.ajax
    type: 'GET'
    url: '/parse_markdown'
    data:
      markdown: mardown_value
    success: (data, status, xhr) ->
      $('#'+body_preview).html(data)
      $('#'+dv_preview).addClass('active')
      $('#'+lk_preview).addClass('active')
      $('#'+dv_write).removeClass('active')
      $('#'+lk_write).removeClass('active')