class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user_index = User.all
    @new_book = Book.new
  end

  def show
    @new_book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update
      flash[:notice] = "更新しました"
      redirect_to user_path(@user) || root_path
    else
      flash[:alert] = "更新に失敗しました"
      redirect_to edit_user_path(@user) || root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
