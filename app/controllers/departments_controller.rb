class DepartmentsController < ApplicationController
  before_action :admin_access, only: [:new, :create]
  def index
    @departments = Department.all
  end

  def new
    @department = Department.new
  end

  def create
    department = Department.new(department_params)
    if department.save
      flash[:success] = '新しい部署を作成しました'
      redirect_to departments_path
    else
      render 'new'
    end
  end

  def squeeze
    @department = Department.find(params[:department_id])
    @user_departments = @department.user_departments
  end

  private

    def admin_access
      unless current_user.admin?
        flash[:danger] = '管理者権限が無いためアクセスできません'
        redirect_to user_path(current_user.id)
      end
    end

    def department_params
      params.require(:department).permit(:department_name)
    end
end
