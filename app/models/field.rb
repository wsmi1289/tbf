class Field < ApplicationRecord
  has_many :plantings, dependent: :delete_all
  has_many :beds, through: :plantings

  def current_planted_beds(plant, harvest)
    plantings.inject(0) do |sum, p|
      if ((p.transplanted_at > plant && p.transplanted_at < harvest) ||
        (plant > p.transplanted_at && plant < p.harvested_at))
        sum + p.num_beds.to_f
      else
        sum
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