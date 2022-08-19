class BooksController < ApplicationController
  before_action :authenticate_user!
  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "投稿できました。"
      redirect_to book_path(@book) || root_path
    else
      flash[:alert] = "投稿ができませんでした。"
      redirect_to request.referrer || root_path
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update

  end

  def destroy

  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
