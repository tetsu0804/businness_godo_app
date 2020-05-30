require 'rails_helper'

RSpec.feature '勤務簿作成', type: :feature do
  before do
    @tetsu = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true, first_name: '哲朗', last_name: '吉田', address: '山形県米沢市御廟二丁目')
    login_as @tetsu
  end

  scenario '出勤と退勤' do
    visit '/'
    click_link '打刻'
    uncheck 'work_book[paid]'
    click_button '出勤'
    expect(WorkBook.count).to eq 1
    work_book = WorkBook.last
    expect(page).to have_content '出勤しました。'
    expect(page.current_path).to eq root_path
    visit current_path
    visit '/'
    click_link '打刻'
    click_button '退勤'
    expect(page).to have_content '退勤しました。'
    expect(page.current_path).to eq root_path
  end
end
