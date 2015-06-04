window.Ndfies       = window.Ndfies || {}
window.Ndfies.Jplayer       = window.Ndfies.Jplayer || {}

$ ->
  Ndfies.Jplayer.player = (url) ->
    $(document).ready ->
      $('#jquery_jplayer_1').jPlayer
        ready: ->
          $(this).jPlayer 'setMedia',
            mp3: url
            oga: url
          return
        swfPath: '/js'
        supplied: 'mp3,oga'
