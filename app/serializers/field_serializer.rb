class FieldSerializer < BaseSerializer
  attributes :id, :name
  conditional_attrs :bed_count, :length, :width, :num_beds
  
  has_many :plantings, if: -> { requested?(:plantings) }
  
  def bed_count
    object.current_planted_beds(Date.today.beginning_of_year, Date.today.end_of_year)
  end
end
