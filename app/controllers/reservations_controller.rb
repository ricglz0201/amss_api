# Controller for reservations
class ReservationsController < ApplicationController
  def show
    @reservation = Reservation.includes(:user, :stop)
                              .where(user: { id: params[:user_id] },
                                     id: params[:id])
    render json: @reservation
  end

  def index
    @reservations = Reservation.includes(:user, :stop)
                               .where(user: { id: params[:user_id] })
    render json: @reservations
  end

  def create
    @reservation = Reservation.new(object_params)
    if @reservation.save
      render json: { 'message': 'Success' }
    else
      puts @reservation.errors
      render json: { 'error': @reservation.errors }
    end
  end

  private

  def object_params
    params.require(:reservation).permit(:user_id, :stop_id, :trip_id)
  end
end
