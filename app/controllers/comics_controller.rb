class ComicsController < ApplicationController
  def index
    @user = current_user
    @comics = Comic.all
  end

  def show
    @comic = Comic.find(params[:id])
  end

  def new
    @comic = Comic.new
  end

  def create
    @comic = Comic.new(comic_params)
    @comic.user = current_user
    if @comic.save
      redirect_to comics_path
    else
      render :new
    end
  end

  def edit
    @comic = Comic.find(params[:id])
  end

  def update
    @comic = Comic.find(params[:id])
    @comic.update(comic_params)
    redirect_to comic_path(@comic)
  end

  def destroy
    @comic = Comic.find(params[:id])
    @comic.destroy
    redirect_to comics_path
  end

  private

  def comic_params
    params.require(:comic).permit(:title, :description, :category, :publication_date, :photo)
  end
end
