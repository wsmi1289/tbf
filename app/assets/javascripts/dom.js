function __(el) {
	if (window === this) { return new __(el); };
	this.e = document.querySelector(el);
	return this;
};

__.prototype = {
	on: function (event, callback) {
		this.e.addEventListener(event, callback, false);
	},

	addClass: function (classes) {
		this.e.classList.add(classes);
		return this;
	},

	css: function (styles) {
		var styleString = JSON.stringify(styles).cssTextify();
		this.e.style.cssText = styleString;
		return this;
	},

	removeClass: function (classes) {
		this.e.classList.remove(classes);
		return this;
	},

	replaceClass: function (replaced, replacer) {
		this.e.classList.replace(replaced, replacer);
		return this;
	},

	html: function (newContent) {
		this.e.innerHTML = newContent;
		return this;
	},

	height: function () {
		return this.e.height;
	},

	val: function (value) {
		this.e.value = value;
		return this;
	},

	width: function () {
		return this.e.width;
	}
}
