class SearchService
  def initialize(model, params, user_id)
    @model = model
    @params = params
    @current_user = User.find(user_id)
  end

  def search
    @models = @model.all
    @models = filter_models if @params.key?(:filter)
    @models = find_models if @params.key?(:q)
    @models = @models.try(:in_stock) || @models if @current_user.client?
    sort_models
  end

  private
    def find_models
       @models.search_scope(@params[:q])
    end

    def filter_models
       @models.where(category_id: @params[:filter][:category])
    end

    def sort_models
      sort_direction = @params[:direction] == 'down' ? 'DESC' : 'ASC'
      sort_col = @params[:sort] == 'price' ?
        @params[:sort] : "LOWER(#{@params[:sort] || 'title'})"
      @models.order(Arel.sql("#{sort_col} #{sort_direction}"))
    end
end