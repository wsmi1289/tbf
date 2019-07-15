var Slider = function (fieldId, plantedBeds, plantings) {
  this.fieldId = fieldId;
  this.plantings = plantings;
  this.plantedBeds = plantedBeds;
};

Slider.prototype.generateDates = function () {
  var today = new Date(),
      day = today.getDate(),
      month = today.getMonth(),
      year = today.getFullYear(),
      future = today.setFullYear(year, month+8, day),
      past = today.setFullYear(year, month-2, day);
  return { future: future, past: past };
};

Slider.prototype.init = function () {
  var dates = this.generateDates();
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
        hiddenBeds = $('.hidden > .bed').length;

    ((ui.values[0] <= harvestedAt) && (ui.values[1] >= plantedAt)) ?
      plantingEl.removeClass('hidden') : plantingEl.addClass('hidden');
    $('.bed-count').html(this.plantedBeds - hiddenBeds + ' Beds');
  }.bind(this));
};