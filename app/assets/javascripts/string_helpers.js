String.prototype.truncate = function (length, ending) {
		ending = ending || '...';
		return this.length > length ?
			this.substring(0, length - ending.length) + '...' : this;
},

String.prototype.kebab = function () {
	if (this.includes('_')) {
		return this.replace(/_/g, '-');
	} else {
		return this;
	}
}

String.prototype.cssTextify = function () {
	return this.replace(/"/g,'').replace(/,/g, ';').kebab().slice(1, -1) + ';';
}

// Array.prototype.unzip = function () {
// 	var length = 0;
// 	this.filter( function (arrayEl) {
// 		if (Array.isArray(arrayEl)) {
// 			length = Math.max(arrayEl.length, length);
// 			return true;
// 		}
// 	});
// 	var result = [];
// 	for (var i = 0; i < length; i++) {
// 		result[i] = this.map( function (arrayEl) {
// 			return arrayEl[i];
// 		})
// 	}
// 	return result;
// }

// Array.prototype.zip = function () {
// 	var array = Array.prototype.slice.call(arguments);
// 	array.unshift(this);
// 	return array.unzip();
// }

// Array.prototype.zipObject = function (values) {
// 	var result = {};
// 	for (var i = 0; i < this.length; i++) {
// 		result[this[i]] = values[i];
// 	}
// 	return result;
// }


// Object.prototype.only = function () {
// 	var result = {},
// 			properties = Array.prototype.slice.call(arguments);
// 	for (var i = 0; i < properties.length; i++) {
// 		result[properties[i]] = this[properties[i]];
// 	}
// 	return result;
// }