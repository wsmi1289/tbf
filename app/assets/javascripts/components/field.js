var initField = function () {
	Vue.component('flat-pickr', VueFlatpickr);
	Vue.component('field', {
	  template: '#field-template',
	  props: ['field', 'crops'],

	  provide: function () {
	  	return { crops: this.crops, field: this.field };
	  },

	  components: {
	  	VueSlider: window['vue-slider-component'],
	  	VueFlatpickr: window['vue-flatpickr-component']
	  },

	  data: function () {
			return {
				bedCount: 0,
				config:  {
			    altFormat: 'M d, Y',
			    altInput: true,
			    dateFormat: 'M d, Y',
			    wrap: true
			  },
				dateRange: [365, 500],
				name: '',
				plantings: [],
				styleObj: {
					height: this.field.width + 'px',
					width: this.field.length + 'px'
				}
			}
	  },

	  mounted: function () {
	  	this.bedCount = this.field.bed_count;
	  	this.name = this.field.name;
	  	this.plantings = this.field.plantings;
	  },

	  computed: {
	  	computedStart: {
				get: function () {
					return this.startDate.format('MMM D, YYYY');
				},
        set: function (newVal) {
        	var newDate = Math.ceil(this.dateRange[0] - this.startDate.diff(newVal, 'days', true));
        	Vue.set(this.dateRange, 0, newDate);
        }
	  	},

	  	startDate: function () {
	  		return moment().subtract(1, 'year').add(this.dateRange[0], 'days');
	  	},

	  	computedEnd: {
				get: function () {
					return this.endDate.format('MMM D, YYYY');
				},
        set: function (newVal) {
        	var newDate = Math.ceil(this.dateRange[1] - this.endDate.diff(newVal, 'days', true));
        	Vue.set(this.dateRange, 1, newDate);
        }
	  	},

	  	endDate: function () {
	  		return moment().subtract(1, 'year').add(this.dateRange[1], 'days');
	  	},

	  	editPath: function () { return 'fields/' + this.field.id + '/edit'},
	  },
	  methods: {
	  	destroyField: function () {
	  		if ( confirm("Are you sure you want to delete the field?") ) {
	  			$.ajax({
	  				url: 'fields/' + this.field.id,
	  				method: "DELETE"
	  			})
	  		}
	  	}
	  }
	})
};