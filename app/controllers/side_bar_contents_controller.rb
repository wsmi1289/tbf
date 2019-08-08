class SideBarContentsController < ApplicationController
  before_action :set_side_bar_content, only: [:show, :edit, :update, :destroy]
  before_action :current_user_admin?, except: [:show]

  # GET /side_bar_contents
  # GET /side_bar_contents.json
  def index
    @side_bar_contents = SideBarContent.all
  end

  # GET /side_bar_contents/1
  # GET /side_bar_contents/1.json
  def show
  end

  # GET /side_bar_contents/new
  def new
    # @side_bar = Sidebar.find(params[:side_bar_id])
    @side_bar_content = SideBarContent.new
    # @side_bar.side_bar_contents.build
  end

  # GET /side_bar_contents/1/edit
  def edit
  end

  # POST /side_bar_contents
  # POST /side_bar_contents.json
  def create
    @side_bar_content = SideBarContent.new(side_bar_content_params)

    respond_to do |format|
      if @side_bar_content.save
        format.html { redirect_to @side_bar_content, notice: 'Side bar content was successfully created.' }
        format.json { render :show, status: :created, location: @side_bar_content }
      else
        format.html { render :new }
        format.json { render json: @side_bar_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /side_bar_contents/1
  # PATCH/PUT /side_bar_contents/1.json
  def update
    respond_to do |format|
      if @side_bar_content.update(side_bar_content_params)
        format.html { redirect_to @side_bar_content, notice: 'Side bar content was successfully updated.' }
        format.json { render :show, status: :ok, location: @side_bar_content }
      else
        format.html { render :edit }
        format.json { render json: @side_bar_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /side_bar_contents/1
  # DELETE /side_bar_contents/1.json
  def destroy
    @side_bar_content.destroy
    respond_to do |format|
      format.html { redirect_to side_bar_contents_url, notice: 'Side bar content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_side_bar_content
      @side_bar_content = SideBarContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def side_bar_content_params
      params.require(:side_bar_content).permit(:content, :image, :link, :page_id, :title)
    end
end
