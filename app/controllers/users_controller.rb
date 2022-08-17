class UsersController < ApplicationController
before_action :authenticate_user!
 def index
 end

 def show
  @books = Book.all
  @book = Book.new
 end

 def edit
 end

 def update
 end
end