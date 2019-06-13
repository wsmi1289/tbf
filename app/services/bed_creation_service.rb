class BedCreationService
  def initialize(planting_id)
    @planting = Planting.find(planting_id)
  end

  def create
    @planting.num_beds.floor.times do |b|
      Bed.create(field: @planting.field, planting: @planting, percent_used: 1)
    end
    handle_partial_bed
  end

  def update
    diff = @planting.beds.count - @planting.num_beds
    if diff.positive?
      @planting.beds.last(diff.floor).each { |b| b.destroy }
    elsif diff.negative?
      diff.abs.floor.times do |b|
        Bed.create(field: @planting.field, planting: @planting, percent_used: 1)
      end
    end
    handle_partial_bed
  end

  private

  def handle_partial_bed
    @percent = (@planting.num_beds.to_f % 1).to_d
    puts '***********************************'
      puts complementary_bed.to_json
    if complementary_bed.present? && @percent != 0
      # puts '***********************************'
      # puts complementary_bed
      new_percent = complementary_bed.percent_used + @percent
      puts new_percent
      complementary_bed.update(percent_used: new_percent)
    else
      Bed.create(field: @planting.field, planting: @planting, percent_used: @percent)
    end
  end

  # Looks for any bed in field which has room for more
  def complementary_bed
    @_complementary_bed = @planting.field.plantings.map do |p|
      p.beds.detect { |bed| (bed.percent_used + @percent) <= 1 }
    end.compact.first
  end
end