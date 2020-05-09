e = {
	any: function (array, testFunction) {
		for (var i = 0; i < array.length; i++) {
			if (testFunction(array[i])) { return true; }
		}
		return false;
	},

	assign: function () {
		return Object.assign.apply(this, arguments);
	},

	clone: function (obj) {
		return Object.assign({}, obj);
	},

	compact: function (array) {
		return array.filter(function(element) {
			return !!element || element === 0;
		});
	},

	difference: function (array1, array2) {
		return array1.filter( function (array1Val) {
			return !array2.includes(array1Val);
		})
	},

	// returns array of elements that neither have in common
	disjunctUnion: function (array1, array2) {
		return array1.filter( function (array1Val) {
			return !array2.includes(array1Val);
		}).concat( array2.filter( function (array2Val) {
				return !array1.includes(array2Val);
			})
		)
	},

	get: function (object, path, defaultVal) {
		var result = Object.getOwnPropertyDescriptor(object, path);
		return result === undefined ? defaultVal : result;
	},

	intersection: function () {
		return array1.filter( function (array1Val) {
			return array2.includes(array1Val);
		})
	},

	union: function () {
		return array1.concat(array2).reduce( function (accumulator, element) {
			if (accumulator.indexOf(element) === -1) {
				accumulator.push(element)
			};
			return accumulator;
		});
	},

	unique: function (array) {
		return array.reduce( function (accumulator, element) {
			if (accumulator.indexOf(element) === -1) {
				accumulator.push(element)
			};
			return accumulator;
		});
	},

	unzip: function (array) {
		var length = 0;
		array.filter( function (arrayEl) {
			if (Array.isArray(arrayEl)) {
				length = Math.max(arrayEl.length, length);
				return true;
			}
		});
		var result = [];
		for (var i = 0; i < length; i++) {
			result[i] = array.map( function (arrayEl) {
				return arrayEl[i];
			})
		}
		return result;
	},

	zip: function () {
		return e.unzip(Array.prototype.slice.call(arguments));
	},

	zipObject: function (properties, values) {
		var result = {};
		for (var i = 0; i < properties.length; i++) {
			result[properties[i]] = values[i];
		}
		return result;
	}



}