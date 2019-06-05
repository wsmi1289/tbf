class Post < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_scope, against: {
    title: 'A',
    body: 'B'
  }, using: { tsearch: { prefix: true } }

  mount_uploader :image, ImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_image
  enum title_position: {
    left_top: 0, right_top: 1, center_top: 2,
    left_middle: 3, right_middle: 4, center_middle: 5,
    left_bottom: 6, right_bottom: 7, center_bottom: 8 }
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true
  validates :image, presence: true

  def crop_image
    image.recreate_versions! if crop_x.present?
  end
end
