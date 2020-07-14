class PlantingSerializer < BaseSerializer
  attributes :id
  conditional_attrs :crop, :seeded_at, :transplanted_at, :target_harvest_date, :num_beds, :bed_width

  has_many :beds, if: -> { requested?(:beds) }

  def crop
    object.crop.as_json(only: %i[id name])
  end
end
