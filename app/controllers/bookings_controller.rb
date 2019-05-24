class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @your_bookings = []
    @bookings.each do |booking|
      @comic = booking.comic
      @your_bookings << @comic
    end
  end

  def new
    @comic = Comic.find(params[:comic_id])
    @booking = Booking.new
  end

  def create
    @comic = Comic.find(params[:comic_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.comic = Comic.find(params[:comic_id])
      if @booking.save
        redirect_to user_bookings_path(@comic)
      else
        render :new
      end
  end

  def destroy
    @user = current_user
    @booking = @user.bookings
  end

private
  def booking_params
    params.require(:booking).permit(:available, :user_id, :comic_id)
  end
end
