// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require lodash
//= require jquery3
//= require jquery_ujs
//= require jquery-ui
//= require jcrop
//= require popper
// = require bootstrap
//= require summernote/summernote-bs4.min
//= require activestorage
//= require turbolinks
//= require_tree .
//= require moment
//= require flatpickr
//= require vue
//= require vue-slider
//= require vue-flatpickr

window['moment-range'].extendMoment(moment);
// window['vue-slider-component']
// Vue.component('flat-pickr', VueFlatpickr);
function log (data) {
	return console.log(data)
}

var data = {"data":[{"id":"1","type":"field","relationships":{"plantings":{"data":[{"id":"43","type":"planting"},{"id":"45","type":"planting"},{"id":"46","type":"planting"},{"id":"50","type":"planting"},{"id":"51","type":"planting"},{"id":"52","type":"planting"},{"id":"53","type":"planting"}]}}},{"id":"4","type":"field","relationships":{"plantings":{"data":[{"id":"47","type":"planting"},{"id":"48","type":"planting"},{"id":"49","type":"planting"},{"id":"54","type":"planting"}]}}}]}
var multi = {"data": [{ "id":"1","type":"field","relationships": {
        			"plantings": {
        				"data": [{"id":"43","type":"planting"},{"id":"45","type":"planting"},{"id":"46","type":"planting"},{"id":"50","type":"planting"},{"id":"51","type":"planting"},{"id":"52","type":"planting"},{"id":"53","type":"planting"}]
        			}
        		}
        	},
        	{
        		"id":"4","type":"field","relationships": {
	        		"plantings": {
		        		"data":[{"id":"47","type":"planting"},{"id":"48","type":"planting"},{"id":"49","type":"planting"},{"id":"54","type":"planting"}]
	        		}
        		}
        	}
        ]
      }

function unserialize(json) {
	var final = {};
	json['data'].forEach(function (obj) {
		console.log(obj)
		// var type = _.toString(obj['type']) + 's';
		// final[type] = _.omit(obj, ['type', 'relationships']);
		// if (obj['relationships']) {
		// 	var key = _.toString(_.keys(obj['relationships'])[0]);
		// 	final[type][key] = unserialize(obj['relationships'][key]);
		// 	// console.log(obj['relationships'][key])
		// }
		// final[type][relationType] = obj['relationships'];
	});
	return final;
};