class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_departments, dependent: :destroy
  has_many :departments, through: :user_departments, dependent: :destroy
  has_many :work_books, dependent: :destroy
  has_many :job_contents
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true

  def today_works
    self.work_books.where('created_at >= ?', Time.zone.now.beginning_of_day).first
  end

  def work_index_will_pagenate(params)
    self.work_books.paginate(page: params,per_page: 15)
  end

  def name_full
    "#{self.last_name} #{self.first_name} さん"
  end
end
