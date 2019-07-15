module FieldHelper
  def room_in_field?
    current_beds = @planting.field.planted_beds_scoped(
      @planting.transplanted_at, @planting.harvested_at)
    @planting.field.num_beds > current_beds + @planting.num_beds.to_f
  end
end