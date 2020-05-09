dateUtils = {
	parse: function (date) {
		return new Date(date).toDateString().substring(4);
	},
	anyOverlap: function (start1, end1, vals) {
		// moment().isBetween(moment-like, moment-like);
		// return ((start1 <= vals[1]) && (vals[0] <= end1))
		// return ((start1 > vals[0] && start1 < vals[1]) ||
		// 	(vals[0] > start1 && vals[0] < end1))
	}
}