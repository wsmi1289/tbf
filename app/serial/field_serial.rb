class FieldSerializer < BaseSerializer
  attributes :id, :name, :length, :width, :num_beds
  attribute :bed_count
  has_many :plantings

  def bed_count(object)
    object.current_planted_beds(Date.today.beginning_of_year, Date.today.end_of_year)
  end
end