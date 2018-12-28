class Product < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  belongs_to :category

  # Pg Search stuff
  include PgSearch
  pg_search_scope :search_products, associated_against: {
    category: [:name] }, against: {
    title: 'A',
    description: 'B',
    price: 'C'
  }, using: { tsearch: { prefix: true } }

  # Image Processing
  mount_uploader :image, ImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_image


  # Validations
  validates :image, presence: true
  validates :title, :description, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  before_destroy :ensure_not_referenced_by_any_line_item

  def crop_image
    image.recreate_versions! if crop_x.present?
  end

  def self.latest
    Product.order(:updated_at).last
  end

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items Present')
      return false
    end
  end
end
