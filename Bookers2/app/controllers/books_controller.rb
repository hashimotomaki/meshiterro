class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "successfully"
    else
      @books = Book.all
      render action: :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = @book.user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params[:id])
      redirect_to book_path(@book.id), notice: "successfully"
    else
      render action: :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: "successfully"
  end

  private
   def book_params
     params.require(:book).permit(:title, :body)
   end

end
