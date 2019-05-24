class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @your_bookings = []
    @bookings.each do |booking|
      @comic = booking.comic
      @your_bookings << @comic
    end
  end

  def new
    @comic = Comic.find(params[:comic_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @comic = Comic.find(params[:comic_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    authorize @booking
    @booking.comic = Comic.find(params[:comic_id])
      if @booking.save
        @booking.comic.available = false
        redirect_to user_bookings_path(@comic)
      else
        render :new
      end
  end

  def destroy
    @user = current_user
    authorize @booking
    @booking = @user.bookings
  end

private
  def booking_params
    params.permit(:user_id, :comic_id)
  end
end
