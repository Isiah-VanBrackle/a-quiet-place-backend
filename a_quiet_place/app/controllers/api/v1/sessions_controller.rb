class Api::V1::SessionsController < ApplicationController

  def login
    @user = User.find_by(user_name: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      render json: {
        user: {user_id: @user.id, first_name: @user.first_name, last_name: @user.last_name, user_name: @user.user_name},
        books: @user.books #this should show the users books i believe.
      }
    else
      render json: {
        error: "Invalid Username or Password"
      }, status: :unauthorized
    end
  end

  def persist
    id = request.headers["Authorization"]
    @user = User.find(id)
    render json: {
      user: {user_id: @user.id, first_name: @user.first_name, last_name: @user.last_name, user_name: @user.user_name},
      books: @user.books #this should show the users books i believe.
    }
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
