class FamiliesController < ApplicationController
  before_action :set_family, only: [:edit, :update, :destroy]
  before_action :current_user_admin?

  def index
    @families = Family.all
  end

  def new
    @family = Family.new
  end

  def edit
  end

  def create
    @family = Family.new(family_params)
    notice = @family.save ? 'Success' : 'Error'
    redirect_to fields_path, notice: notice
  end

  def update
    notice = @family.update(family_params) ? 'Success' : 'Error'
    redirect_to families_path, notice: notice
  end

  def destroy
    notice = @family.destroy ? 'Success' : 'Error'
    redirect_to crops_path, notice: notice
  end

  private

    def set_family
      @family = Family.find(params[:id])
    end

    def family_params
      params.require(:family).permit(:companions, :biomass, :erosion,
        :name, :nitrogen, :preceding, :root_structure, :succeeding,
        :weed_competition)
    end
end
