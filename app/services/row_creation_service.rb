class RowCreationService
  def initialize(num_rows, field_id)
    @num_rows = num_rows
    @field_id = field_id
  end

  def create
    @num_rows.each {|r| Row.create(field: field) }
  end
end