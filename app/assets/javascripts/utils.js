dateUtils = {
	anyOverlap: function (start1, end1, vals) {
		return ((start1 > vals[0] && start1 < vals[1]) ||
			(vals[0] > start1 && vals[0] < end1))
	}
}