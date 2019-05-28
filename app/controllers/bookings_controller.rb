class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @your_bookings = []
    @bookings.each do |booking|
      @comic = booking.comic
      @your_bookings << @comic
    end
  end

  def create
    @comic = Comic.find(params[:comic_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    authorize @booking
    @booking.comic = Comic.find(params[:comic_id])
    @booking.save
    @booking.comic.status = "Pending"
    @booking.comic.save
    redirect_to comic_path(@comic)
  end

  def pending
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @pendings = @bookings.select do |booking|
      booking.comic.user == current_user && booking.pending
    end
    authorize @bookings
  end

  def update
    @booking = Booking.find(params['id'])
    @booking.pending = false
    @booking.save
    authorize @booking
      a = current_user.bookings.select do |booking|
        booking.pending == true && booking.comic.user != current_user
      end
      if a.empty?
        redirect_to comics_path
      else
        redirect_to user_pending_path(current_user)
      end
  end

  def destroy
    @user = current_user
    authorize @booking
    @booking = @user.bookings
  end

  private

  def booking_params
    params.permit(:user_id, :comic_id, :pending)
  end
end
