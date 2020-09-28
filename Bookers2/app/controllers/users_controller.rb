class UsersController < ApplicationController

   before_action :authenticate_user!
   before_action :ensure_correct_user, {only: [:edit, :update]}

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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id),notice: "successfully"
    else
     render action: :edit
    end
  end



  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :opinion,:image)
  end

  def ensure_correct_user
    user = User.find(params[:id])
    if user != current_user
       redirect_to user_path(current_user)
    end
  end

end