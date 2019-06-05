titlePosition = function (position, postTitle) {
	switch(position) {
		case "left_top":
			postTitle.addClass('left');
			break;
		case "right_top":
			postTitle.addClass('right');
			break;
		case "center_top":
			postTitle.addClass('center');
			break;
		case "left_middle":
			postTitle.addClass('left mt-5');
			break;
		case "right_middle":
			postTitle.addClass('right mt-5');
			break;
		case "center_middle":
			postTitle.addClass('center mt-5');
			break;
		case "left_bottom":
			postTitle.addClass('left mt-5 pt-5');
			break;
		case "right_bottom":
			postTitle.addClass('right mt-5 pt-5');
			break;
		case "center_bottom":
			postTitle.addClass('center mt-5 pt-5');
			break;
		default:
			postTitle.addClass('center mt-5');
	};
};