class CropsController < ApplicationController
  before_action :current_user_admin?
  before_action :set_crop, except: [:index, :create, :new]

  def index
    @crops = Crop.all
  end

  def new
    @crop = Crop.new
  end

  def edit
    @crop = Crop.find(params[:id])
  end

  def create
    @crop = Crop.new(crop_params)
    notice = @crop.save ? 'Success' : 'Error'
    redirect_to fields_path, notice: notice
  end

  def update
    notice = @crop.update(crop_params) ? 'Success' : 'Error'
    redirect_to crops_path, notice: notice
  end

  def destroy
    notice = @crop.destroy ? 'Success' : 'Error'
    redirect_to crops_path, notice: notice
  end

  private
    def crop_params
      params.require(:crop).permit(:name, :family_id, :transplanted,
        :row_spacing, :plant_spacing)
    end

    def set_crop
      @crop = Crop.find(params[:id])
    end
end