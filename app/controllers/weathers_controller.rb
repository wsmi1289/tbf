class WeathersController < ApplicationController
  before_action :current_user_admin?
  def index
    @weathers = current_user.weathers.order('measurement_date desc').limit(7)
  end

  def destroy
    notice =  Weather.find(params[:id]).destroy ? 'Success' : 'Error'
    redirect_to weathers_path, notice: notice
  end
end