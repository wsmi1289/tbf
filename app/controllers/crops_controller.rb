class CropsController < ApplicationController
  def new
    @crop = Crop.new
  end
end