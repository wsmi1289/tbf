titlePosition = function (position, postTitle) {
	switch(position) {
		case "top_left":
			postTitle.addClass('left');
			break;
		case "top_right":
			postTitle.addClass('right');
			break;
		case "top_center":
			postTitle.addClass('center');
			break;
		case "center_left":
			postTitle.addClass('left mt-5');
			break;
		case "center_right":
			postTitle.addClass('right mt-5');
			break;
		case "ccenter":
			postTitle.addClass('center mt-5');
			break;
		case "bottom_left":
			postTitle.addClass('left mt-5 pt-5');
			break;
		case "bottom_right":
			postTitle.addClass('right mt-5 pt-5');
			break;
		case "bottom_center":
			postTitle.addClass('center mt-5 pt-5');
			break;
		default:
			postTitle.addClass('center mt-5');
	};
};