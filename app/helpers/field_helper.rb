module FieldHelper
  def room_in_field?
    current_beds = @planting.field.current_planted_beds(
      @planting.transplanted_at, @planting.target_harvest_date)
    @planting.field.num_beds > current_beds + @planting.num_beds.to_f
  end

  def bed_count(field)
    field.current_planted_beds(start, finish)
  end

  def start
    Date.today.beginning_of_year
  end

  def finish
    Date.today.end_of_year
  end
end