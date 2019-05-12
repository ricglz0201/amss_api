# Controller for reservations
class ReservationsController < ApplicationController
  include GeneralPrivateMethods
  def show
    @reservation = Reservation.joins(:user)
                              .where('users.uuid = ? && reservations.id = ?',
                                     params[:user_id], params[:id])
    render json: @reservation
  end

  def index
    @reservations = Reservation.joins(:user, :stop, :trip)
                               .where('users.uuid = ?', params[:user_id])
    render json: @reservations, except: dates,
           include: { stop: except_dates, trip: { only: [:date] } }
  end

  def create
    trip = find_or_create_trip
    return render_error('Ya está ocupado') unless trip.reservation.nil?

    if create_reservation(trip)
      render json: { 'success': 'Reservation created' }
    else
      render_error(@res.errors.full_messages)
    end
  end

  private

  def find_or_create_trip
    Trip.where(date: params[:date], seat_id: params[:seat_id]).first_or_create
  end

  def render_error(error)
    render json: { 'error': error }
  end

  def create_reservation(trip)
    @res = Reservation.new
    @res.user_id = User.find_by(uuid: params[:user_id]).id
    @res.stop_id = params[:stop_id]
    @res.trip_id = trip.id
    @res.save
  end
end
