var tbfEvent = {
	expandText: function (fullText, id) {
		var btn = "<div class='btn btn-link expand-text'>See Comment</div>",
				truncatedText = fullText.length > 200 ? fullText.truncate(200) + btn : fullText,
				textEl = $(".text-content[data-id='"+id+"'"),
				collapseBtn = $(".collapse-text[data-id='"+id+"'");

		textEl.html(truncatedText);

		textEl.find('.expand-text').on('click', function () {
	    textEl.html(fullText);
			collapseBtn.removeClass('hidden');
		}),

	  collapseBtn.on('click', function () {
			tbfEvent.expandText(fullText, id);
			collapseBtn.addClass('hidden');
	  })
	},

	showHideComments: function () {
		$('.view-all-comments').on('click', function () {
			$('.comments-three').toggleClass('hidden');
			$('.all-comments').toggleClass('hidden');
			ws('.view-all-comments').toggleText('View All', 'Hide');
		})
	},

	showImageName: function (imagePath) {
		$('.custom-file-input').on('change', function () {
	    var fileName = $(this).val().split('\\').pop();
	    $(this).next('.custom-file-label').text(fileName);
		});
		if (imagePath.length) {
			var fileName = imagePath.split('/').pop();
			$('.custom-file-label').text(fileName);
		}
	},
}

