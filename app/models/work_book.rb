class WorkBook < ApplicationRecord
  belongs_to :user
  enum paid: { vacation: true, work: false }


  def self.this_month_work(user)
    joins(:user).where('user_id' => user, 'created_at' => Time.zone.now.beginning_of_month..Time.zone.now)
  end

  def self.join_user(user)
    joins(:user).where(user_id: user)
  end

  def self.date_search(searching)
    where(created_at: searching.in_time_zone.all_month)
  end
end
