class JobContentsController < ApplicationController
  before_action :admin_access, only: [:new, :create, :select_user, :by_month, :what_month]

  def new
    @job_content = JobContent.new
    @departments = Department.all
  end

  def create
    @job_content = JobContent.new(job_content_params)
    if @job_content.save
      flash[:success] = '仕事作成送信しました。'
      redirect_to root_path
    else
      flash[:danger] = '仕事作成送信失敗しました。'
      render 'new'
    end
  end

  def show
    @job_content = JobContent.find(params[:id])
  end

  def select_user
    @users = User.joins(:user_departments).where(user_departments: {department_id: params[:job_content][:department_id] })
  end

  def by_month
    @job_contents = JobContent.order("start_time DESC").where(start_time:  Time.now.all_month)
    @past_jobs = JobContent.group_by_month(:start_time, format: "%Y%m").count
  end

  def what_month
    year = params[:month]
    this_year = year[0..3]
    this_month = year[4..5]
    time = Time.local(this_year.to_i, this_month.to_i)

    @month = Time.parse("#{time}")

    @job_contents = JobContent.where(start_time: @month.all_month).order("start_time DESC")
    @past_jobs = JobContent.group_by_month(:start_time, format: "%Y%m").count
  end

  private

    def admin_access
      unless current_user.admin?
        flash[:danger] = '管理者権限が無いためアクセスできません'
        redirect_to user_path(current_user.id)
      end
    end

    def job_content_params
      params.require(:job_content).permit(:title, :description, :start_time, :price, :work_address, :user_id, :department_id, :trading_company_id)
    end
end
