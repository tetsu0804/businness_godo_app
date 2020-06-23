class HomeController < ApplicationController
  def home
    @user = User.find(current_user.id)
    @job_contents = JobContent.today_job(@user)
    @jobs = JobContent.joins(:user).where(users: {id: @user})
  end
end
