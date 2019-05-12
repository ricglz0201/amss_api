# Controller for routes
class RoutesController < ApplicationController
  include GeneralPrivateMethods

  def index
    @routes = Route.select(:id, :name)
    render json: @routes
  end

  def show
    @route = Route.find(params[:id])
    render json: @route
  end

  private

  def association
    { buses: { include: { seats: except_dates }, except: dates },
      stops: except_dates }
  end
end
