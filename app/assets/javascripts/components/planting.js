var initPlanting = function () {
	Vue.component('planting', {
	  template: '#planting-template',
	  props: ['endDate', 'planting', 'field', 'startDate'],
	  data: function () {
			return {
				cropName: null,
				numBeds: null,
				beds: null,
				transplanted: null,
				harvested: null
			}
	  },
	  created: function () {
	  	this.getPlanting();
	  },
	  computed: {
	  	displayed: function () {
	  		var plantingSeason = moment.range(this.transplanted,this.harvested),
        		selectedRange = moment.range(this.startDate, this.endDate);

    		return selectedRange.overlaps(plantingSeason);
	  	},
	  	cropClass: function () {
	  		return _.toLower(this.planting.crop.name)
	  	}
	  },
	  methods: {
	  	getPlanting: function () {
	  		var vm = this;
	  		$.get('/plantings/'+ vm.planting.id).done( function (response) {
	  			_.assign(vm.planting, response);
	  			vm.beds = vm.planting.beds;
	  			vm.numBeds = parseInt(vm.planting.num_beds);
	  			vm.cropName = vm.planting.crop.name;
	  			vm.transplanted = moment(vm.planting.transplanted_at);
	  			vm.harvested = moment(vm.planting.target_harvest_date);
	  			vm.initTooltip();
	  		})
	  	},
	  	initTooltip: function () {
	  		var vm = this;
	  		$(vm.$el).tooltip({
		  		html: true,
		  		title: "<div><h5>"+vm.cropName+"</h5><h6>"+vm.numBeds+" Beds</h6><p><strong>Transplanted:</strong> "+vm.transplanted.format('MMM D, YYYY')+"</p><p><strong>Harvested:</strong> "+vm.harvested.format('MMM D, YYYY')+"</p></div>"
		  	});
	  	},
	  	toggleTooltip: function () { $(this.$el).tooltip('toggle'); }
	  }
	})
};