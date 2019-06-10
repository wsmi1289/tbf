module PaginationHelper
  def all?
    params[:all] == 'true'
  end
    
  def paginate(models)
    models.limit(per_page).offset(@page*per_page) unless all?
  end

  def per_page
    10
  end

  def no_back?
    @page <= 0
  end

  def no_next?(model)
    model_count = model.all.count
    [1, @page, @page+1].include?((model_count/per_page).ceil)
  end

  def showing_all?(model)
    model_count = model.all.count
    model_count <= per_page || params[:all] == 'true'
  end
end