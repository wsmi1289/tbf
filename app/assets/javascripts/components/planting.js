var initPlanting = function () {
	Vue.component('planting', {
	  template: '#planting-template',
	  props: ['endDate', 'planting', 'startDate'],
	  inject: ['crops', 'field'],
	  data: function () {
			return {
				beds: [],
				cropClass: _.toLower(this.planting.crop.name),
				transplanted: moment(this.planting.transplanted_at),
				harvested: moment(this.planting.target_harvest_date)
			}
	  },

	  mounted: function () {
	  	this.getBeds();
			this.initTooltip();
	  },

	  computed: {
	  	displayed: function () {
	  		var plantingSeason = moment.range(this.transplanted, this.harvested),
        		selectedRange	 = moment.range(this.startDate, this.endDate);
    		return selectedRange.overlaps(plantingSeason);
	  	},
	  },
	  methods: {
	  	getBeds: function () {
	  		var vm = this;
	  		$.get('/beds', { planting_id: vm.planting.id }).done( function (response) {
	  			vm.beds = response;
	  		})
	  	},

	  	initTooltip: function () {
	  		var harvested 		= this.harvested.format('MMM D, YYYY'),
	  				name 					= this.planting.crop.name,
	  				numBeds 			= parseInt(this.planting.num_beds),
	  				transplanted 	= this.transplanted.format('MMM D, YYYY');

	  		$(this.$el).tooltip({
		  		html: true,
		  		title: "<div><h5>" + name + "</h5><h6>" + numBeds + " Beds</h6><p><strong>Transplanted:</strong> "+ transplanted +"</p><p><strong>Harvested:</strong> " + harvested + "</p></div>"
		  	});
	  	},

	  	toggleTooltip: function () { $(this.$el).tooltip('toggle'); }
	  }
	})
};