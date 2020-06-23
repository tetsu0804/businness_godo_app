class JobContent < ApplicationRecord
  belongs_to :user
  belongs_to :department
  belongs_to :trading_company

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :work_address, presence: true
  validates :start_time, presence: true

  def self.today_job(user)
    date = Date.today
    time_start = Time.zone.local(date.year, date.month, date.day, 00, 00, 00)
    time_end = Time.zone.local(date.year, date.month, date.day, 20, 00, 00)
    joins(:user).where(users: {id: user.id}).where(start_time: time_start .. time_end).order("start_time ASC")
  end
end
