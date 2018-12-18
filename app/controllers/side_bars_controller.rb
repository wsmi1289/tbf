class SideBarsController < ApplicationController
  before_action :set_side_bar, only: [:show, :edit, :update, :destroy]

  # GET /side_bars
  # GET /side_bars.json
  # def index
  #   @side_bars = SideBar.all
  # end

  # GET /side_bars/1
  # GET /side_bars/1.json
  def show
  end

  # # GET /side_bars/new
  def new
    @page = Page.find(params[:id])
    @side_bar = @page.side_bar.build
  end

  # GET /side_bars/1/edit
  def edit
  end

  # POST /side_bars
  # POST /side_bars.json
  def create
    # @page = Page.find(params[:page_id])
    # @side_bar = @page.side_bars.create(side_bar_params)
    # redirect_to page_path(@page.slug)
    @side_bar = SideBar.new(side_bar_params)

    respond_to do |format|
      if @side_bar.save
        @page = Page.find(@side_bar.page_id)
        format.html { redirect_to edit_page_path(@page.slug), notice: 'Side bar was successfully created.' }
        format.json { render :show, status: :created, location: @side_bar }
      else
        format.html { render :new }
        format.json { render json: @side_bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /side_bars/1
  # PATCH/PUT /side_bars/1.json
  def update
    respond_to do |format|
      if @side_bar.update(side_bar_params)
        format.html { redirect_to @side_bar, notice: 'Side bar was successfully updated.' }
        format.json { render :show, status: :ok, location: @side_bar }
      else
        format.html { render :edit }
        format.json { render json: @side_bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /side_bars/1
  # DELETE /side_bars/1.json
  def destroy
    @side_bar.destroy
    respond_to do |format|
      format.html { redirect_to side_bars_url, notice: 'Side bar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_side_bar
      @side_bar = SideBar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def side_bar_params
      params.require(:side_bar).permit(:page_id, :side)
    end
end
