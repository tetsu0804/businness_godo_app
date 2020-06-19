class JobContent < ApplicationRecord
  belongs_to :user
  belongs_to :department

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :work_address, presence: true
  validates :start_time, presence: true
end
