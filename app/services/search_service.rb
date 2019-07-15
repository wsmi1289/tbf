class SearchService
  def initialize(model, params, client)
    @model = model
    @params = params
    @is_client = client
  end

  def search
    @models = @model.all
    @models = filter_models if @params.key?(:filter)
    @models = find_models if @params.key?(:q)
    @models = @models.try(:in_stock) || @models if @is_client
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