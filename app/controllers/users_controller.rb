class UsersController < ApplicationController
  before_action :authenticate_user!, [:index]

  def index
  end

  def show
  end

  def edit
  end

  def update

  end
end