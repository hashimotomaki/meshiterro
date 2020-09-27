class UsersController < ApplicationController

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def show
    @book = Book.new
    @books = Book.all
    @user = User.find(params[:id])
  end

  def edit
    @book = book.find(params[:id])
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id),notice: "successfully"
  end



  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :opinion,:image)
  end

end
