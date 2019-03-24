Array.prototype.remove = function (args) {
	args = args.length ? args : [args];
	return this.filter(function (el) {
		return !args.includes(el);
	});
}