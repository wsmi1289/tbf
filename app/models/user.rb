class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  enum role: { root: 0, admin: 1, client: 2, user: 3 }

  # image upload
  mount_uploader :image, ImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  validates :image, presence: true
  after_update :crop_image

  def crop_image
    image.recreate_versions! if crop_x.present?
  end
end
