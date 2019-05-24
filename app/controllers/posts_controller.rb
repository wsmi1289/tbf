class PostsController < ApplicationController
  before_action :set_page, only: [:index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = SearchService.new(Post, params, current_user.id).search
    @posts = @posts.limit(2).offset(@page*2) unless all?
    redirect_to products_path(params.permit(:q)) if @posts.empty?
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
      if post_params[:image].present?
        render :crop
      else
        redirect_to @post
      end
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      if post_params[:image].present?
        render :crop
      else
        redirect_to @post
      end
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

    def post_params
      params.require(:post).permit(:title, :body, :image, :crop_x, :crop_y, :crop_w, :crop_h, :title_position)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
