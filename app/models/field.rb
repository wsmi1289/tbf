class Field < ApplicationRecord
  has_many :plantings, dependent: :delete_all
  has_many :rows, dependent: :delete_all
end