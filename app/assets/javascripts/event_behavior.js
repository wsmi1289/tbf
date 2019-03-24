var tbfEvent = {
	expandText: function (fullText) {
		var btn = "<div class='btn btn-link expand-text'>See Comment</div>";

		var truncatedText = fullText.truncate(200) + btn,
				contentWrapper = __('.text-content'),
				collapseBtn = __('.collapse-text');

		contentWrapper.html(truncatedText);

		__('.expand-text').on('click', function () {
	    contentWrapper.html(fullText);
			collapseBtn.removeClass('hidden');
		}),

	  collapseBtn.on('click', function () {
			tbfEvent.expandText(fullText);
			collapseBtn.addClass('hidden');
	  })
	}
}

