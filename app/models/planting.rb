class Planting < ApplicationRecord
  # include ActiveModel::Dirty
  # define_attribute_methods :num_beds
  belongs_to :field
  belongs_to :crop
  has_many :beds, dependent: :delete_all

  before_update :update_beds, if: -> { self.num_beds_changed? }

  private
    def update_beds
      puts '***********************************'
      puts 'changed'
      puts self.num_beds_changed?
      BedCreationService.new(id).update
    end
end