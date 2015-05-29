window.Ndfies                     = window.Ndfies || {}
window.Ndfies.Jquery_upload       = window.Ndfies.Jquery_upload || {}

$ ->
  Ndfies.Jquery_upload.init = ->
    $('#new_track').fileupload
      dataType: 'json'

      add: (e, data) ->
        data.context = $('<p/>').text('Uploading...').appendTo(document.body)
        data.submit()

      done: (e, data) ->
        data.context.text 'Upload finished.'

      progressall: (e, data) ->
        progress = parseInt(data.loaded / data.total * 100, 10)
        $('#progress .bar').css 'width', progress + '%'
