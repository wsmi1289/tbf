class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @post = Post.find(params[:post_id])
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end
    
  def create
    @post = Post.find(params[:comment][:post_id])
    
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment.post_id)
    @comment.destroy

    redirect_to post_path(@post)
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:name, :body, :post_id, :user_id)
    end
end
