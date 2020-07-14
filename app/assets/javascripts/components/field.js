var initField = function () {
	Vue.component('field', {
	  template: '#field-template',
	  props: ['field'],
	  components: {
	  	VueSlider: window['vue-slider-component']
	  },
	  data: function () {
			return {
				dateRange: [365, 500],
				name: null,
				bedCount: null,
				plantings: [],
				styleObj: {
					height: this.field.table.width + 'px',
					width: this.field.table.length + 'px'
				}
			}
	  },
	  mounted: function () {
	  	this.bedCount = this.field.table.bed_count;
	  	this.name = this.field.table.name;
	  	this.plantings = this.field.table.plantings;
	  },
	  computed: {
	  	startDate: function () {
	  		return moment().subtract(1, 'year').add(this.dateRange[0], 'days');
	  	},
	  	formattedStartDate: function () {
	  		return this.startDate.format('MMM D, YYYY');
	  	},
	  	endDate: function () {
	  		return moment().subtract(1, 'year').add(this.dateRange[1], 'days');
	  	},
	  	formattedEndDate: function () {
	  		return this.endDate.format('MMM D, YYYY');
			},
	  	editPath: function () { return 'fields/' + this.field.table.id + '/edit'},
	  },
	  methods: {
	  	destroyField: function () {
	  		if ( confirm("Are you sure you want to delete the field?") ) {
	  			$.ajax({
	  				url: 'fields/' + this.field.table.id,
	  				method: "DELETE"
	  			})
	  		}
	  	}
	  }
	})
};