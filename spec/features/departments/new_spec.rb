require 'rails_helper'

RSpec.feature '部署作成', type: :feature do
  before do
    @tetsu = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true, first_name: '哲朗', last_name: '吉田', address: '山形県米沢市御廟二丁目')
    login_as @tetsu
  end

  scenario '作成成功', js: true do
    visit '/'
    click_link '管理'
    click_link '社員ページ'
    click_link '部署作成リンク'
    fill_in 'department[department_name]', with: '短距離部署'
    click_button '作成'
    expect(page.current_path).to eq departments_path
    expect(page).to have_content '新しい部署を作成しました'
    expect(page).to have_link '短距離部署'
    expect(Department.count).to eq 1
  end

  scenario 'Adminは部署作成リンクが無い' do
    eriko = User.create( email: 'test1@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: '絵理子', last_name: '早坂', address: '山形県米沢市御廟二丁目')
    login_as eriko
    visit '/'
    expect(page).to_not have_link '管理'
    expect(page).to have_link '連絡帳'
  end
end
