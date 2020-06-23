class HomeController < ApplicationController
  def home
    @user = User.find(current_user.id)
    date = Date.today
    time_start = Time.zone.local(date.year, date.month, date.day, 00, 00, 00)
    time_end = Time.zone.local(date.year, date.month, date.day, 20, 00, 00)

    @job_contents = JobContent.joins(:user).where(users: {id: @user.id}).where(start_time: time_start .. time_end).order("start_time ASC")
  end
end
