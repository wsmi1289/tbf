class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]
  def index
    @users = User.all
  end

  def show
  end

  def update
    if @user.update(user_params)
      if user_params[:image].present?
        render :crop
      else
        redirect_to @user, notice: 'User was successfully updated.'
      end
    else
      render :edit
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:image)
    end
end