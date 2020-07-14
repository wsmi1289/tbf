class PlantingSerializer < BaseSerializer
  attributes :seeded_at, :transplanted_at, :target_harvest_date, :num_beds, :bed_width
  # belongs_to :field
  belongs_to :crop
  has_many :beds
end