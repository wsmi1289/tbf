class Field < ApplicationRecord
  has_many :plantings, dependent: :delete_all
  has_many :beds, through: :plantings

  def planted_beds_scoped(plant, harvest)
    plantings.inject(0) do |sum, planting|
      if planting.transplanted_at.between?(plant, harvest) ||
        planting.harvested_at.between?(plant, harvest)
        sum + planting.num_beds.to_f
      else
        sum + 0
      end
    end
  end

  def planted_beds
    plantings.sum(:num_beds).to_f
  end

  def empty_beds
    num_beds - planted_beds
  end
end