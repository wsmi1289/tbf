class CropSerializer < BaseSerializer
  attributes :id, :name
  conditional_attrs :transplanted, :row_spacing, :plant_spacing
end
