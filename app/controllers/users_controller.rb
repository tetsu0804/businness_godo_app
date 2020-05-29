class UsersController < ApplicationController
  before_action :not_admin, only: [:edit, :update, :destroy]
  def show
    @user = User.find(params[:id])
    @user_departments = @user.user_departments
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    @departments = Department.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_edit_params)
      flash[:success] = "#{@user.last_name} #{@user.first_name}さんを更新しました"
      redirect_to user_path(@user.id)
    else
      flash[:alert] = '更新に失敗しました'
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    flash[:notice] = "#{user.last_name} #{user.first_name}さんを削除しました"
    user.destroy
    user_departments = user.user_departments
    user_department = user_departments.last
    redirect_to departments_path
  end

  private

    def not_admin
      unless current_user.admin?
        flash[:alert] = '管理者ではない為アクセスできません'
        redirect_to user_path(current_user.id)
      end
    end

    def user_edit_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name,
      :address, { department_ids: [] })
    end
end
