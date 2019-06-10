class FieldsController < ApplicationController
  include PlantingHelper
  before_action :set_field, only: [:show, :edit, :update, :destroy]

  def index
    @fields = Field.all
    @field = Field.new
  end

  def edit
  end

  def create
    @field = Field.new(field_params)
    notice = @field.save ? 'Success' : 'Error'
    redirect_to fields_path, notice: notice
  end

  def update
    notice = @field.update(field_params) ? 'Success' : 'Error'
    #   all_params[:num_rows].to_i.times {|r| puts r+1 }
    # end
    redirect_to fields_path, notice: notice
  end
  private
    def field_params
      params.require(:field).permit(:name, :length, :width, :num_beds)
    end

    # def field_params
    #   all_params.reject{|p| p == 'num_rows'}
    # end

    def set_field
      @field = Field.find(params[:id])
    end
end