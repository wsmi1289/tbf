class Field < ApplicationRecord
  has_many :plantings, dependent: :destroy
end