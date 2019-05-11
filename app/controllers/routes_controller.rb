# Controller for routes
class RoutesController < ApplicationController
  def index
    @routes = Route.all.select(:id, :name)
    render json: @routes
  end

  def show
    @route = Route.find(params[:id])
    render json: @route
  end
end
