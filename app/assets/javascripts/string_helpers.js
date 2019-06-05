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