var tbfEvent = {
	expandText: function (fullText, id) {
		var btn = "<div class='btn btn-link expand-text'>See Comment</div>";

		var truncatedText = fullText.length > 200 ?
					_.truncate(fullText, { length: 200 }) + btn :
					fullText;
				contentWrapper = $('.text-content[data-id="'+id+'"]'),
				collapseBtn = $('.collapse-text');

		contentWrapper.html(truncatedText);

		$('.expand-text').on('click', function () {
	    contentWrapper.html(fullText);
			collapseBtn.removeClass('hidden');
		}),

	  collapseBtn.on('click', function () {
			tbfEvent.expandText(fullText);
			collapseBtn.addClass('hidden');
	  })
	},

	showHideComments: function () {
		$('.view-all-comments').on('click', function () {
			$('.comments-three').toggleClass('hidden');
			$('.all-comments').toggleClass('hidden');
			$('.view-all-comments').toggleText('View All', 'Hide');
		})
	}
}

