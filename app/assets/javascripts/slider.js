var Slider = function (fieldId, plantedBeds, plantings) {
  this.fieldId = fieldId;
  this.plantings = plantings;
  this.plantedBeds = plantedBeds;
};

Slider.prototype.generateDates = function (response) {
  var today = new Date(),
      startArray = response.start.split('-'),
      endArray = response.end.split('-');
  return {
    future: today.setFullYear(endArray[0], endArray[1]-1, endArray[2]),
    past: today.setFullYear(startArray[0], startArray[1]-1, startArray[2])
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
      $( '#date-' + this.fieldId ).find('label').html(
        "Start: " + new Date(ui.values[0]).toDateString().substring(4) +
        " - End: " + new Date(ui.values[1]).toDateString().substring(4)
      );
      this.renderPlantings(ui);
    }.bind(this),
    stop: function(event, ui) {}
  });
};

Slider.prototype.renderPlantings = function (ui) {
  _.each(this.plantings, function (p) {
    var plantedAt = new Date(p.transplanted_at).getTime(),
        harvestedAt = new Date(p.harvested_at).getTime(),
        plantingEl = $('.planting-hover[data-planting="'+ p.id +'"]'),
        count = $('#field-'+this.fieldId).find('.bed').not('.hidden .bed').length;

    dateUtils.anyOverlap(plantedAt, harvestedAt, ui.values) ?
      plantingEl.removeClass('hidden') : plantingEl.addClass('hidden');

    $('.bed-count[data-id="'+this.fieldId+'"]').html(count + ' Beds');
  }.bind(this));
};