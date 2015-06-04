(function ($) {
  $.extend({
    uploadPreview : function (options) {

      // Options + Defaults
      var settings = $.extend({
        input_field: ".image-input",
        preview_box: ".image-preview",
        label_field: ".image-label",
        label_default: "Choose File",
        label_selected: "Change File",
        no_label: false
      }, options);

      // Check if FileReader is available
      if (window.File && window.FileList && window.FileReader) {
        if (typeof($(settings.input_field)) !== 'undefined' && $(settings.input_field) !== null) {
          $(settings.input_field).change(function() {
            var files = event.target.files;

            if (files.length > 0) {
              var file = files[0];
              var reader = new FileReader();

              // Load file
              reader.addEventListener("load",function(event) {
                var loadedFile = event.target;

                // Check format
                if (file.type.match('image')) {
                  // Image
                  $(settings.preview_box).css("background-image", "url("+loadedFile.result+")");
                  $(settings.preview_box).css("background-size", "cover");
                  $(settings.preview_box).css("background-position", "center center");
                } else if (file.type.match('audio')) {
                  // Audio
                  $(settings.preview_box).html(
                  "<div class='jp-jplayer' id='jquery_jplayer_1'></div>" +
                  "<div class='jp-audio' id='jp_container_1'>" +
                    "<div class='jp-type-single'>" +
                      "<div class='jp-title'></div>" +
                      "<div class='jp-gui jp-interface'>" +
                        "<ul class='jp-controls'>" +
                          "<li>" +
                            "<a class='jp-play'></a>" +
                          "</li>" +
                          "<li>" +
                            "<a class='jp-pause'></a>" +
                          "</li>" +
                          "<li>" +
                            "<a class='jp-mute'></a>" +
                          "</li>" +
                          "<li>" +
                            "<a class='jp-unmute'></a>" +
                          "</li>" +
                        "</ul>" +
                        "<div class='jp-progress'>" +
                          "<div class='jp-seek-bar'>" +
                            "<div class='jp-play-bar'></div>" +
                          "</div>" +
                        "</div>" +
                        "<div class='jp-time-holder'>" +
                          "<div class='jp-current-time'></div>" +
                        "</div>" +
                        "<div class='jp-volume-bar'>" +
                          "<div class='jp-volume-bar-value'></div>" +
                        "</div>" +
                        "<div class='jp-no-solution'>" +
                          "<span>Update Required</span>" +
                          "To play the media you will need to either update your browser to a recent version or update your" +
                        "</div>" +
                      "</div>" +
                    "</div>" +
                  "</div>"
                  );
                  $(document).ready(function() {
                    return $('#jquery_jplayer_1').jPlayer({
                      ready: function() {
                        $(this).jPlayer('setMedia', {
                          mp3: loadedFile.result,
                          oga: loadedFile.result
                        });
                      },
                      swfPath: '/js',
                      supplied: 'mp3,oga'
                    });
                  });
                } else {
                  alert("This file type is not supported yet.");
                }
              });

              if (settings.no_label == false) {
                // Change label
                $(settings.label_field).html(settings.label_selected);
              }

              // Read the file
              reader.readAsDataURL(file);
            } else {
              if (settings.no_label == false) {
                // Change label
                $(settings.label_field).html(settings.label_default);
              }

              // Clear background
              $(settings.preview_box).css("background-image", "none");

              // Remove Audio
              $(settings.preview_box + " audio").remove();
            }
          });
        }
      } else {
        alert("You need a browser with file reader support, to use this form properly.");
        return false;
      }
    }
  });
})(jQuery);
