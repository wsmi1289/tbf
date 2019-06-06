class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]
  def index
    @users = User.all
  end

  def show
  end

  def update
    if @user.update(user_params)
      user_params[:image].present? ?
        render(:crop) : redirect_to(@user, notice: 'Success.')
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