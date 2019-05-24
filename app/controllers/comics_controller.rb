class ComicsController < ApplicationController
  def index
    @comics = policy_scope(Comic).order(created_at: :desc)
  end

  def show
    @comic = Comic.find(params[:id])
    authorize @comic
  end

  def new
    @comic = Comic.new
    authorize @comic
  end

  def create
    @comic = Comic.new(comic_params)
    @comic.user = current_user
    authorize @comic
    if @comic.save
      redirect_to comics_path
    else
      render :new
    end
  end

  def edit
    @comic = Comic.find(params[:id])
    @comic.user = current_user
    authorize @comic
  end

  def update
    @comic = Comic.find(params[:id])
    @comic.user = current_user
    authorize @comic
    @comic.update(comic_params)
    redirect_to comic_path(@comic)
  end

  def destroy
    @comic = Comic.find(params[:id])
    @comic.user = current_user
    authorize @comic
    @comic.destroy
    redirect_to comics_path
  end

  private

  def comic_params
    params.require(:comic).permit(:title, :description, :category, :publication_date, :photo)
  end
end
