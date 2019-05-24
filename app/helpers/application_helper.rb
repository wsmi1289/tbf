module ApplicationHelper
  Rails::Html::WhiteListSanitizer.allowed_tags = %w(table tr td a p span h1 h2 h3 h4 h5 h6 div img ul ol li u b)
  Rails::Html::WhiteListSanitizer.allowed_attributes = %w(id class style src href) 
  def sortable(column, title)
    direction = (column == params[:sort] && params[:direction] == 'down') ?
      'up' : 'down'
    link_to(title, store_path(sort: column, direction: direction))
  end
end
