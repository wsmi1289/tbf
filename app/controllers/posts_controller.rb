class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :searching?

  def index
    @posts = Post.all
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

    # respond_to do |format|
      if @post.save
        if params[:post][:image].present?
          render :crop
        else
          redirect_to @post
        end
        # format.html { redirect_to @post, notice: 'Post was successfully created.' }
        # format.json { render :show, status: :created, location: @post }
      else
        render :new
        # format.html { render :new }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    # end
  end

  def update
    # respond_to do |format|
      if @post.update(post_params)
        if params[:post][:image].present?
          render :crop
        else
          redirect_to @post
        end
        # format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        # format.json { render :show, status: :ok, location: @post }
      else
        render :edit
        # format.html { render :edit }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    # end
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
      params.require(:post).permit(:title, :body, :image, :crop_x, :crop_y, :crop_w, :crop_h)
    end
    
    def searching?
      if params.has_key?(:q)
        @posts = Post.search_posts(params[:q]).order("created_at DESC")
        render "index"
      end
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
