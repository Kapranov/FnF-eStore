//= require summernote/summernote.min.js
//= require summernote/summernote-ru-RU.js
//= require summernote/summernote-uk-UA.js

$(function() {
    $('.summernote').summernote({
      height: 100,
      minHeight: null,
      maxHeight: null,
      focus: false,
      toolbar: [
        ["style", ["style"]],
        ["fontsize", ["fontsize"]],
        ["color", ["color"]],
        ["style", ["bold", "italic", "underline", "clear"]],
        ["para", ["ul", "ol", "paragraph"]],
        ["height", ["height"]]
      ]
    });
    var edit = function () {
        $('.click2edit').summernote({ focus: true });
    };
    $("#edit").click(function () {
        $('.click2edit').summernote({ focus: true });
    });
    $("#save").click(function () {
        var aHTML = $('.click2edit').code(); //save HTML If you need(aHTML: array).
        $('.click2edit').destroy();
    });
});
