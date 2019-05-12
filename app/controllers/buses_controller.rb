# Controller for buses
class BusesController < ApplicationController
  include GeneralPrivateMethods

  def index
    @buses = Bus.joins(:routes)
                .where(routes: { id: params[:route_id] })
    render json: @buses,
           include: { seats: { except: %i[created_at updated_at bus_id] } },
           except: dates
  end
end
