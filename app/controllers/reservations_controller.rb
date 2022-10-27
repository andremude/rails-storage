class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
    @storage = Storage.find(params[:storage_id])
  end

  def create
    @storage = Storage.find(params[:storage_id])
    @reservation = Reservation.new(find_params)
    @reservation.user = current_user
    @reservation.storage = Storage.find(params[:storage_id])

    if @reservation.save
      redirect_to reservations_path
    else
      render :new
    end
  end

  def index
    @reservations = current_user.reservations
  end

  def show
    @reservations = Reservation.find(params[:id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(find_params)
    if @reservation.save
      redirect_to reservation_path(@reservation), notice: "Reservation has been updated"
    else
      render :edit
    end
  end

  def destroy
    @reservations = Reservation.find(params[:id])
    @reservations.destroy
    redirect_to reservations_path
  end

  private

  def find_params
    params.require(:reservation).permit(
      :start_date,
      :end_date,
    )
  end
end
