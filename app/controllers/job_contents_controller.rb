class JobContentsController < ApplicationController
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

  def select_user
    #@select_departments = UserDepartment.where(department_id: params[:job_content][:department_id])
    @users = User.joins(:user_departments).where(user_departments: {department_id: params[:job_content][:department_id] })
  end

  private

    def job_content_params
      params.require(:job_content).permit(:title, :description, :start_time, :price, :work_address, :user_id, :department_id)
    end
end
# t.string "title", null: false
# t.text "description", null: false
# t.datetime "start_time", null: false
# t.integer "price", null: false
# t.string "work_address", null: false
# t.integer "user_id"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.integer "department_id"
# t.index ["department_id"], name: "index_job_contents_on_department_id"
# t.index ["user_id"], name: "ind
