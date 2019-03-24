// $(document).on 'turbolinks:load', ->
//   $('[data-provider="summernote"]').each ->
//     $(this).summernote
//       height: 300
$(document).on('turbolinks:load', function () {
	$('[data-provider="summernote"]').each(function () {
		$(this).summernote({
			height: 300
		})
	})
});

