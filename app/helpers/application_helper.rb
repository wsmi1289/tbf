module ApplicationHelper
  def sortable(column, title)
    direction = (column == params[:sort] && params[:direction] == 'ASC') ? 'DESC' : 'ASC'
    link_to(title, store_path(sort: column, direction: direction))
  end
end
