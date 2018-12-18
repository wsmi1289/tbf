class SideBar < ApplicationRecord
  belongs_to :page
  has_many :side_bar_contents, dependent: :destroy
end
