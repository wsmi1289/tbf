var Slider = function (fieldId, plantedBeds, plantings, yr) {
  this.fieldId = fieldId;
  this.plantings = plantings;
  this.yr = yr;
  this.plantedBeds = plantedBeds;
  return this;
};

Slider.prototype.getPlantings = function (e) {
  this.yr = e.target.value;
  this.render();
};

Slider.prototype.generateDates = function (response) {
  var today = new Date(),
      startArray = response.start.split('-').map(function (val) { return parseInt(val) }),
      endArray = response.end.split('-').map(function (val) { return parseInt(val) });
  return {
    future: today.setFullYear(endArray[0], endArray[1]-1, endArray[2]),
    past: today.setFullYear(startArray[0], startArray[1]-4, startArray[2])
  }
};

Slider.prototype.init = function (yrData) {
  var dates = this.generateDates(yrData);
  $('.slider-' + this.fieldId).slider({
    range: true,
    min: dates.past,
    max: dates.future,
    values: [ dates.past, dates.future ],
    slide: function( event, ui ) {
      $( '#date-' + this.fieldId ).find('.date-label span').html(
        dateUtils.parse(ui.values[0]) + " - " + dateUtils.parse(ui.values[1])
      );
      this.renderPlantings(ui);
    }.bind(this),
    stop: function(event, ui) {}
  });
};

Slider.prototype.render = function () {
  $.get('/plantings', { planting: { year_id: this.yr, field_id: this.fieldId  } })
  $.get('/years/' + this.yr, this.init.bind(this));
};

Slider.prototype.renderPlantings = function (ui) {
  _.each(this.plantings, function (p) {
    var plantingEl = $('.planting-hover[data-planting="'+ p.id +'"]'),
        count = $('#field-'+this.fieldId).find('.bed').not('.hidden .bed').length,
        plantingSeason = moment.range(moment(p.transplanted_at), moment(p.target_harvest_date)),
        selectedRange = moment.range(moment(ui.values[0]), moment(ui.values[1]));

    selectedRange.overlaps(plantingSeason) ?
      plantingEl.removeClass('hidden') : plantingEl.addClass('hidden');

    $('.bed-count[data-id="'+this.fieldId+'"]').html(count + ' Beds');
  }.bind(this));
};