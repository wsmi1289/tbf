class Planting < ApplicationRecord
  # include ActiveModel::Dirty
  # define_attribute_methods :num_beds
  belongs_to :field
  belongs_to :crop
  belongs_to :year
  has_many :beds, dependent: :delete_all
  
  scope :in_field, -> (start, finish) { 
    where(
      "transplanted_at BETWEEN :start AND :finish OR harvested_at BETWEEN :start AND :finish", { start: start, finish: finish })
  }

  scope :current, -> (currentYear) {
    where('extract(year from transplanted_at) = ?', currentYear)
  }

  before_update :update_beds, if: -> { self.num_beds_changed? }

  private
    def update_beds
      BedCreationService.new(id).update
    end
end