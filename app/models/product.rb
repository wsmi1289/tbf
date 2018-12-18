class Product < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_products, associated_against: {
    category: [:name] }, against: {
    title: 'A',
    description: 'B',
    price: 'C'
  }, using: { tsearch: { prefix: true } }

  mount_uploader :image, ImageUploader
  validates :image, presence: true
  
  has_many :line_items, dependent: :destroy
  belongs_to :category

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true

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
