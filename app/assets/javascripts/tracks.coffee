window.Ndfies                     = window.Ndfies || {}
window.Ndfies.Jquery_upload       = window.Ndfies.Jquery_upload || {}

$ ->
  Ndfies.Jquery_upload.init = ->
    $.uploadPreview
      input_field: '#audio-upload'
      preview_box: '#audio-preview'
      no_label: true

    $('#new_track').fileupload
      dataType: 'json'

      add: (e, data) ->
        $("#submit").click ->
          $('#status').text("Uploading...")
          data.submit()
          $('#status').text("Upload finished.")
          #TODO: show flash error message

      done: (e, data) ->

      progressall: (e, data) ->
        progress = parseInt(data.loaded / data.total * 100, 10)
        $('#progress .bar').css 'width', progress + '%'
