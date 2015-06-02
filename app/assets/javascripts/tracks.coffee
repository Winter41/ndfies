window.Ndfies                     = window.Ndfies || {}
window.Ndfies.Jquery_upload       = window.Ndfies.Jquery_upload || {}

$ ->
  Ndfies.Jquery_upload.init = ->
    $('#new_track').fileupload
      dataType: 'json'

      add: (e, data) ->
        $('#status').text("Uploading...")
        data.submit()
        $('#status').text("Upload finished.")

      done: (e, data) ->

      progressall: (e, data) ->
        progress = parseInt(data.loaded / data.total * 20, 10)
        $('#progress .bar').css 'width', progress + '%'

    $("#track_file").on 'change', ->
      audio = new Audio()
      audio.addEventListener "canplaythrough", (->
        audio.play()
      ), false

    $("#submit").click ->
      data.submit()
