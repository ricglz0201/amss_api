# Controller for stops
class StopsController < ApplicationController
  include GeneralPrivateMethods

  def index
    @stops = Stop.joins(:routes)
                 .where(routes: { id: params[:route_id] })
    render json: @stops, except: dates
  end
end
