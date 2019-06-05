class SideBarContent < ApplicationRecord
  belongs_to :page
  mount_uploader :image, ImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_image

end
