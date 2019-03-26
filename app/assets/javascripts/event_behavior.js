var tbfEvent = {
	expandText: function (fullText) {
		var btn = "<div class='btn btn-link expand-text'>See Comment</div>";

		var truncatedText = _.truncate(fullText, { length: 200 }) + btn,
				contentWrapper = $('.text-content'),
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
	}
}

