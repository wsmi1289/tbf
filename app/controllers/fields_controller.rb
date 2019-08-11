class FieldsController < ApplicationController
  include FieldHelper
  include PlantingHelper
  # before_action :current_user_admin?
  before_action :set_field, only: [:edit, :update, :destroy]
  
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
    redirect_to fields_path, notice: notice
  end

  def destroy
    @field.destroy
    redirect_to fields_path
  end
  private
    def field_params
      params.require(:field).permit(:name, :length, :width, :num_beds)
    end

    def set_field
      @field = Field.find(params[:id])
    end
end