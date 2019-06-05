session = {
	all: function () {
		return Object.keys(sessionStorage).map(function (key) {
			return JSON.parse(sessionStorage.getItem(key));
		})
	},

	clear: function () {
		sessionStorage.clear();
	},

	get: function (key) {
		return JSON.parse(sessionStorage.getItem(key));
	},

	remove: function (key) {
		sessionStorage.removeItem(key);
	},

	set: function (key, val) {
		sessionStorage.setItem(key, JSON.stringify(val));
	}
}