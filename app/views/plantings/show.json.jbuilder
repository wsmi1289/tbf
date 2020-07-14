json.extract! @planting, :id, :seeded_at, :transplanted_at, :target_harvest_date, :num_beds, :bed_width
json.crop @planting.crop, :id, :name, :transplanted, :row_spacing, :plant_spacing
json.beds @planting.beds, :id, :percent_used


