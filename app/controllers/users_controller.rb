# Controller for users
class UsersController < ApplicationController
  def show
    @user = User.find(params[:uid])
    render json: @user
  end
end
