class BooksController < ApplicationController

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    flash[:notice] = "You have created book succesfully."
    redirect_to book_path(@book.id)
  end

  def index
    @books = Book.all
    @book = Book.find(params[:id])
    @book_new = Book.new
  end

  def show
    @books = Book.all
    @book = Book.find(params[:id])
  end

  def destroy
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
