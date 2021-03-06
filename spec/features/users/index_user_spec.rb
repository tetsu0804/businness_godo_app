require 'rails_helper'

RSpec.feature 'Index User', type: :feature do
  before do
    @tetsu = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true, first_name: '哲朗', last_name: '吉田', address: '山形県米沢市御廟二丁目')
    @eriko = User.create( email: 'test1@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: '絵理子', last_name: '早坂', address: '山形県米沢市御廟二丁目')

    @coco = User.create( email: 'test2@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: 'ここ', last_name: '早坂', address: '山形県米沢市御廟二丁目')

    @kanri = Department.create(department_name: '管理部署')
    @tankyori = Department.create(department_name: '短距離')

    @tetsu_kanri = @tetsu.user_departments.create(department_id: @kanri.id)
    @eriko_tankyroi = @eriko.user_departments.create(department_id: @tankyori.id)
    @coco_tankyroi = @coco.user_departments.create(department_id: @tankyori.id)
    login_as @coco
  end

  scenario '部署ユーザー一覧' do
    visit '/'
    click_link '連絡帳'
    click_link '短距離'
    expect(page).to have_link '早坂絵理子さん'
    expect(page).to have_link '早坂ここさん'
    expect(page).to_not have_link '吉田哲朗さん'
    expect(page.current_path).to eq department_squeeze_path(@tankyori.id)
  end
end
