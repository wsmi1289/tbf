class YearsController < ApplicationController
  before_action :current_user_admin?
  def show
    @year = Year.find(params[:id])
    respond_to do |format|
      format.json
    end
  end
end