class ReviewsController < ApplicationController
  def create
    @comic = Comic.find(params[:comic_id])
    @review = Review.new(review_params)
    @review.comic = @comic
    authorize @review
    if @review.save
      respond_to do |format|
        format.html { redirect_to comic_path(@comic) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'comics/show' }
        format.js
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
