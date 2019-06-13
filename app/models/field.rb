class Field < ApplicationRecord
  has_many :plantings, dependent: :delete_all
  has_many :beds, through: :plantings

  def planted_beds
    plantings.sum(:num_beds).to_f
  end

  def empty_beds
    num_beds - planted_beds
  end
end