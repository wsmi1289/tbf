module ApplicationHelper
  def sortable(column, title)
    direction = (column == params[:sort] && params[:direction] == 'ASC') ? 'DESC' : 'ASC'
    link_to(title, sort_path(sort: column, direction: direction))
  end
end
