class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  def index
    @pages = Page.all
  end

  def show
    @sidebar = @page.side_bars.first
  end

  def new
    @page = Page.new
  end

  def edit
    if @page.side_bars.any?
      @side_bar = @page.side_bars.first
      @side_bar_content = @side_bar.side_bar_contents.build
    else
      @side_bar = @page.side_bars.build
    end
  end

  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to page_path(@page.slug), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @page.slug }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    def page_params
      params.require(:page).permit(:slug, :name, :content, :nav_btn)
    end

    def set_page
      @page = Page.find_by(slug: params[:id])
    end
end