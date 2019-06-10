module PlantingHelper
  def planting_name(planting)
    planting.crop.present? ? planting.crop.name : 'New Planting'
  end

  def bed_fraction(planting)
    ((planting.num_beds.to_f % 1) * planting.field.length.to_f).to_i
  end
end