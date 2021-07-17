class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @book.user_id = current_user.id
  end

  def index
    @users = User.all
    @users = User.page(params[:id]).reverse_order
    @book = Book.new
    @book.user_id = current_user.id
  end

  def edit
    @user = User.find(params[:id])
    redirect_to user_path(@user.id) unless current_user.id == @user.id
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
