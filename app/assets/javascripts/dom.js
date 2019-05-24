// // extend jquery
// $.fn.extend({
//     toggleText: function(a, b){
//         return this.text(this.text() == b ? a : b);
//     }
// });

function ws(el) {
	if (window === this) { return new ws(el); };
	this.e = document.querySelector(el);
	return this;
};

ws.prototype = {
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
	},

	text: function (newText) {
		return this.e.textContent = newText;
	},

	toggleText: function (a, b) {
		return this.e.textContent = this.e.textContent == b ? a : b;
	}
}
