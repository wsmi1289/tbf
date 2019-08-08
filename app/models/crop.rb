class Crop < ApplicationRecord
  has_many :plantings
  belongs_to :family
end