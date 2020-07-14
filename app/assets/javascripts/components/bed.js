var initBed = function () {
	Vue.component('bed', {
	  template: '#bed-template',
	  props: ['bed', 'field'],

	  data: function () {
	  	return {
	  	}
	  },
	  computed: {
	  	bedPx: function () {
	  		return this.field.length * this.bed.percent_used
	  	},
 	  }
	})
};