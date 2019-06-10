class Planting < ApplicationRecord
  belongs_to :field
  belongs_to :crop
end