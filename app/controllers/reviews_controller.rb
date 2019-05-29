class ReviewsController < ApplicationController

  def create
    @comic = Comic.find(params[:comic_id])
    @review = Review.new(review_params)
    @review.comic = @comic
    authorize @review
    if @review.save
      redirect_to comic_path(@comic)
    else
      render 'comics/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)

  end
end
