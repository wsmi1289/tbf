class PlantingsController < ApplicationController
  def create
    @planting = Planting.new(planting_params)
    if @planting.save
      redirect_to fields_path, notice: 'Success'
    else
      redirect_to edit_field_path(planting_params[:field_id]), notice: 'Error'
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
      :harvested_at, :num_beds, :seeded_at, :transplanted_at)
  end
end