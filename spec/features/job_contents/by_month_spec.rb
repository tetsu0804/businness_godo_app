require 'rails_helper'
# 未完成
RSpec.feature '月別仕事一覧', type: :feature do
  before do
    @tetsu = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true, first_name: '哲朗', last_name: '吉田', address: '山形県米沢市御廟二丁目')

    @eriko = User.create( email: 'test1@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: '絵理子', last_name: '早坂', address: '山形県米沢市御廟二丁目')

    @coco = User.create( email: 'test2@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: 'ここ', last_name: '早坂', address: '山形県米沢市御廟二丁目')

    @tankyori = Department.create(department_name: '短距離')

    UserDepartment.create(user_id: @eriko.id, department_id: @tankyori.id)

    @job_by_month = JobContent.create(title: 'ヤマダ電気配送', description: '冷蔵庫配送業務 冷蔵庫10台', start_time: 'Sat, 20 Jun 2020 10:00:00 JST +09:00', price: 1000, work_address: '山形県米沢市成島町1-1-11111', user_id: @eriko.id, department_id: @tankyori.id )

    login_as @tetsu
  end

  scenario '今月の仕事一覧' do
    visit '/'
    click_link '管理'
    click_link '今月の社員仕事一覧'
    expect(page).to have_content '2020年6月'
  end
end
