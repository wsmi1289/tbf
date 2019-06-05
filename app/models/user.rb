class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  mount_uploader :image, ImageUploader
  enum role: { root: 0, admin: 1, client: 2, user: 3 }
  # validates :image, presence: true
end
