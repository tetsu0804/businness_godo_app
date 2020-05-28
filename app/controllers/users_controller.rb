class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user_departments = @user.user_departments
  end

  def index
    @users = User.all
  end

end
