class BedSerializer < BaseSerializer
  attributes :id, :percent_used
  belongs_to :planting
end
