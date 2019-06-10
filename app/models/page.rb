class Page < ApplicationRecord
  enum sidebar_status: {
    hide_sidebar: 0,
    left_sidebar: 1,
    right_sidebar: 2,
    bottom_sidebar: 3,
    top_sidebar: 4
  }
  enum link_position: {
    hide_link: 0,
    nav_link: 1,
    select_link: 2,
    bottom_link: 3
  }

  has_many :side_bar_contents, dependent: :destroy
end