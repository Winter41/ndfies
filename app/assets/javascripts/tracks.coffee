window.Ndfies                     = window.Ndfies || {}
window.Ndfies.Jquery_upload       = window.Ndfies.Jquery_upload || {}

$ ->
  Ndfies.Jquery_upload.init = ->
    $('#new_track').fileupload
      dataType: 'json'

      add: (e, data) ->
        $("#track_file").on 'change', ->
          audio = new Audio()
          audio.onload = (e) => $('#preview').attr 'src', e.target.result
          audio.readAsDataURL @files[0]

          #audio.addEventListener "canplaythrough", (->
            #audio.play()
          #), false

        $("#save").click ->
          data.submit()
          $('#status').text("Upload finished.")


      done: (e, data) ->

      progressall: (e, data) ->
        progress = parseInt(data.loaded / data.total * 100, 10)
        $('#progress .bar').css 'width', progress + '%'


