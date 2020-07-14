class Crop < ApplicationRecord
  has_many :plantings
  belongs_to :family
  def latest_plantings
    plantings.joins(:harvests)
      .where("harvests.created_at < ?", Date.today)
      .order("harvests.created_at DESC")
  end
end