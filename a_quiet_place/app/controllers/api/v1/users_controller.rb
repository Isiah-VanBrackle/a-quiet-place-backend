class Api::V1::UsersController < ApplicationController

  def show
    @user =User.find(params[:id])
    render json: {
      user: {user_id: @user.id, first_name: @user.first_name, user_name: @user.user_name},
      books: @user.books #this should show the users books i believe.
    }
  end
end
