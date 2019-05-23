class BookingsController < ApplicationController
  def new
    @comic = Comic.find(params[:comic_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.comic = Comic.find(params[:comic_id])
      if @booking.save
        redirect_to comic_path(comic)
      else
        render :new
      end
  end

  def destroy
    @booking = Booking.destroy(booking_params)
  end

private
  def booking_params
    params.require(:booking).permit(:available)
  end
end
