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
    @models = @models.try(:in_stock) || @models if @current_user.try(:client)
    @models.order("LOWER(title) DESC")
    @models = sort_models if @params.slice(:sort, :direction).keys.count == 2
    @models
  end

  private
    def find_models
       @models.search_scope(@params[:q])
    end

    def filter_models
       @models.where(category_id: @params[:filter][:category])
    end

    def sort_models
      @models.order("LOWER(#{@params[:sort]}) #{@params[:direction]}")
    end
end