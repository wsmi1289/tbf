class CropsController < ApplicationController
  before_action :current_user_admin?
  
  def new
    @crop = Crop.new
  end

  def create
    @crop = Crop.new(crop_params)
    notice = @crop.save ? 'Success' : 'Error'
    redirect_to fields_path, notice: notice
  end

  private
    def crop_params
      params.require(:crop).permit(:name, :family, :transplanted,
        :row_spacing, :plant_spacing)
    end
end