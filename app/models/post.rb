class Post < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_posts, against: {
    title: 'A',
    body: 'B'
  }, using: { tsearch: { prefix: true } }

  mount_uploader :image, ImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_image

  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true
  validates :image, presence: true

  def crop_image
    image.recreate_versions! if crop_x.present?
  end
end
