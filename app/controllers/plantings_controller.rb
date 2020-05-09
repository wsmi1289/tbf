class PlantingsController < ApplicationController
  include FieldHelper
  before_action :current_user_admin?

  def index
    @plantings = Planting.where(planting_params)
    respond_to do |format|
      if @plantings
        format.js
      else
        redirect_to fields_path, notice: 'Error'
      end
    end
  end

  def create
    @planting = Planting.new(planting_params)
    if room_in_field? && @planting.save
      BedCreationService.new(@planting.id).create
      redirect_to fields_path, notice: 'Success'
    else
      redirect_to edit_field_path(planting_params[:field_id]),
        notice: 'Not enough beds in field'
    end
  end
  def update
    @planting = Planting.find(params[:id])
    if @planting.update(planting_params)
      redirect_to fields_path, notice: 'Success'
    else
      redirect_to edit_field_path(planting_params[:field_id]), notice: 'Error'
    end
  end

  private

  def planting_params
    params.require(:planting).permit(:bed_width, :crop_id, :field_id,
      :target_harvest_date, :num_beds, :seeded_at, :transplanted_at, :year_id)
  end
end