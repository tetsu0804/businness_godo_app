require 'rails_helper'

RSpec.feature '当月の出勤簿',type: :feature do
  before do
    travel_to '2020-6-4 10:00'.to_time
    @tetsu = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true, first_name: '哲朗', last_name: '吉田', address: '山形県米沢市御廟二丁目')

    @eriko = User.create( email: 'test1@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: '絵理子', last_name: '早坂', address: '山形県米沢市御廟二丁目')

    @now = Time.zone.parse('2020-6-4 10:00')
    @now_5 = @now + 5.hour

    @work1 = WorkBook.create(paid: false, created_at: @now, user_id: @eriko.id )
    @work2 = WorkBook.create(paid: false, created_at: @now - 1.day, updated_at: @now_5 -1.day, user_id: @eriko.id)

    @work3 = WorkBook.create(paid: false, created_at: @now - 2.day, updated_at: @now_5 - 2.day, user_id: @eriko.id)

    @work4 = WorkBook.create(paid: false, created_at: @now - 6.day, updated_at: @now_5 - 6.day, user_id: @eriko.id)


    login_as @tetsu
  end

  after do
    travel_back
  end

  scenario '成功' do
    visit '/'
    click_link '社員勤務簿'
    click_link '早坂絵理子さん'
    expect(page).to have_content '2020年06月04日'
    expect(page).to have_content '10時00分'
    expect(page).to have_content '2020年06月03日'
    expect(page).to have_content '10時00分'
    expect(page).to have_content '15時00分'
    expect(page).to have_content '2020年06月02日'
    expect(page).to have_content '10時00分'
    expect(page).to have_content '15時00分'
    expect(page).to_not have_content '2020年05月28日'
    puts @work4.created_at
  end

  scenario '月別検索', js: true do
    visit  user_booking_path(@eriko.id)
    fill_in 'work_book[work_search]', with: '202005'
    click_button '検索'
    expect(page).to have_content '2020年05月29日'
    expect(page).to have_content '10時00分'
  end

  scenario '今月ボタン成功', js: true do
    visit user_booking_path(@eriko.id)
    fill_in 'work_book[work_search]', with: '202005'
    click_button '検索'
    click_button '今月'
    expect(page).to have_content '2020年06月04日'
    expect(page).to have_content '10時00分'
    expect(page).to have_content '2020年06月03日'
    expect(page).to have_content '10時00分'
    expect(page).to have_content '15時00分'
    expect(page).to have_content '2020年06月02日'
    expect(page).to have_content '10時00分'
    expect(page).to have_content '15時00分'
    expect(page).to_not have_content '2020年05月28日'
  end
end
