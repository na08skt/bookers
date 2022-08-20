class BooksController < ApplicationController
  before_action :authenticate_user!
  def new

  end

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    if @new_book.save
      flash[:notice] = "投稿できました。"
      redirect_to book_path(@new_book) || root_path
    else
      flash[:alert] = "投稿ができませんでした。"
      redirect_to request.referrer || root_path
    end
  end

  def index
    @new_book = Book.new
    @all_books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.create
  end

  def edit
  end

  def update

  end

  def destroy
    if @delte_book = Book.find(params[:id])
      flash[:notice] = "正常に削除できました"
      redirect_to books_path || root_path
    else
      flash[:notice] = "削除できませんでした"
      redirect_to request.referrer || books_path
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

end
