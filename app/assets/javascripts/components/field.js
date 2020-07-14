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
			    dateFormat: 'M d, Y',//'Y-m-d',
			    wrap: true
			  },
				dateRange: [365, 500],
				end: null,
				name: '',
				plantings: [],
				start: null,
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
					console.log(this.startDate.format('MMM D, YYYY'))
					return this.startDate.format('MMM D, YYYY');
				},
        set: function (newVal) {
        	console.log(newVal)
        	console.log(this.startDate)
        	var newDate = this.dateRange[0] - this.startDate.diff(newVal, 'days', true);
        	console.log(newDate)
        	Vue.set(this.dateRange, 0, Math.ceil(newDate));
        }
	  	},
			//
		  	// formattedStart: function () {
		  	// 	return this.startDate.format('MMM D, YYYY');
		  	// },

		  	// formattedEnd: function () {
		  	// 	return this.endDate.format('MMM D, YYYY');
		  	// },

	  	startDate: function () {
	  		return moment().subtract(1, 'year').add(this.dateRange[0], 'days');
	  	},

	  	computedEnd: {
				get: function () {
					return this.endDate.format('MMM D, YYYY');
				},
        set: function (newVal) {
        	var newDate = this.dateRange[1] - this.endDate.diff(moment(newVal), 'days', true);
        	Vue.set(this.dateRange, 1, Math.ceil(newDate));
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
	  	},

	  	formatDate: function (moment) {
	  		return moment.format('MMM D, YYYY');
	  	}
	  }
	})
};