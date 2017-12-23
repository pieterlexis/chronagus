$ ->
  $('[data-provider="summernote"]').each ->
    $(this).summernote({
      toolbar: [
        ['tools', ['undo', 'redo', 'fullscreen']],
        ['style', ['style', 'bold', 'italic', 'underline', 'strikethrough', 'clear']],
        ['fontsize', ['fontsize']],
        ['lists', ['ul', 'ol']],
      ],
      styleTags: ['h2', 'h3', 'h4', 'p'],
    })
