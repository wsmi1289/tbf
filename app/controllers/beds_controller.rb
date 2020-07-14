class BedsController < ApplicationController
  def index
    @beds = Bed.where(planting_id: params[:planting_id])
    render json: @beds
  end
end
