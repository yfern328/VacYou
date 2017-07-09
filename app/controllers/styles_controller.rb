class StylesController < ApplicationController

  before_action :set_style, only: [:show, :edit, :update, :delete]

  def index
    @styles = Style.all
  end

  def new
    @style = Style.new
  end

  def create
    @style = Style.create(style_params)
    redirect_to style_path(@style)
  end

  def show
    @style = Style.find(params[:id])
  end

  def edit
    @style = Style.find(params[:id])
  end

  def update
    @style.update(style_params)
    redirect_to style_path(@style)
  end

  def delete
    @style.destroy
    redirect_to styles_path
  end

    private

    def style_params
      params.require(:style).permit(:name)
    end

    def set_style
      @style = Style.find(params[:id])
    end

end
