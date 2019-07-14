module FieldHelper
  def room_in_field?
    @planting.field.num_beds > @planting.field.planted_beds + @planting.num_beds
  end
end