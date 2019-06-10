class PostsController < ApplicationController
  include PaginationHelper
  include FormHelper
  before_action :set_page, only: [:index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    svc = SearchService.new(Post, params, current_user.id)
    @posts = paginate(svc.search)
    search_products if @posts.empty?
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      handle_image_cropping
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      handle_image_cropping
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def handle_image_cropping
      post_params[:image].present? ?
        render(:crop) : redirect_to(@post, notice: 'Success.')
    end

    def post_params
      params.require(:post).permit(:title, :body, :image, :crop_x, :crop_y, :crop_w, :crop_h, :title_position)
    end

    def search_products
      svc = SearchService.new(Product, params, current_user.id)
      redirect_to products_path(params.permit(:q)) if svc.search.any?
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
