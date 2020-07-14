var initBed = function () {
	Vue.component('bed', {
	  template: '#bed-template',
	  props: ['bed', 'planting'],
	  inject: ['crops', 'field'],

	  data: function () {
	  	return {
	  		bedPx: { width: (this.field.length * this.bed.percent_used) + 'px' }
	  	}
	  }
	})
};