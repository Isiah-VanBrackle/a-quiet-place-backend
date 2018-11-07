class Api::V1::BooksController < ApplicationController

  def index
    @books = Book.all
    render json:  @books
  end


  def create
    @user = User.find(params[:user_id])
    @book = Book.new(book_params)
      if @book.save
        @user.events << @book
        render json: @ebook, status: :accepted
      else
        render json: {errors: @book.errors.full_messages}, status: :unprocessable_entity
      end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :rating, :snippet, :image) #need to change a file 
  end
end
