class Post < ApplicationRecord
  include PgSearch
  pg_search_scope :search_scope, against: {
    title: 'A',
    body: 'B'
  }, using: { tsearch: { prefix: true } }

  mount_uploader :image, ImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_image
  enum title_position: {
    top_left: 0, top_right: 1, top_center: 2,
    center_left: 3, center_right: 4, center: 5,
    bottom_left: 6, bottom_right: 7, bottom_center: 8 }
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true
  validates :image, presence: true

  def crop_image
    image.recreate_versions! if crop_x.present?
  end
end
