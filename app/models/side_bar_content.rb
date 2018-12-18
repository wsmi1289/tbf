class SideBarContent < ApplicationRecord
  belongs_to :page
  mount_uploader :image, ImageUploader
end
