require 'rails_helper'

RSpec.feature 'Show Users', type: :feature do
  before do
    @tetsu = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true, first_name: '哲朗', last_name: '吉田', address: '山形県米沢市御廟二丁目')
    @eriko = User.create( email: 'test1@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: '絵理子', last_name: '早坂', address: '山形県米沢市御廟二丁目')

    @kanri = Department.create(department_name: '管理部署')
    @tankyori = Department.create(department_name: '短距離')

    @tetsu_kanri = @tetsu.user_departments.create(department_id: @kanri.id)
    @eriko_tankyori = @eriko.user_departments.create(department_id: @tankyori.id)

    login_as @eriko
  end

  scenario 'MyProfile Page' do
    visit '/'
    click_link '早坂絵理子さん'
    expect(page).to have_content '短距離'
    expect(page).to have_content @eriko.id
    expect(page).to have_content '早坂絵理子さん'
    expect(page).to have_content 'test1@test.com'
    expect(page).to_not have_content '山形県米沢市御廟二丁目'
    expect(page).to_not have_link '編集'
  end

  scenario 'Other User Show' do
    visit '/'
    click_link '連絡帳'
    click_link '管理部署'
    click_link '吉田哲朗さん'
    expect(page).to have_content '管理部署'
    expect(page).to have_content @tetsu.id
    expect(page).to have_content '吉田哲朗さん'
    expect(page).to have_content 'test@test.com'
    expect(page).to_not have_content '山形県米沢市御廟二丁目'
    expect(page).to_not have_link '編集'
  end
end
