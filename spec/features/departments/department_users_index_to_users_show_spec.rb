require 'rails_helper'

RSpec.feature '部署一覧からユーザーページへ', type: :feature do
  before do
    @tetsu = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true, first_name: '哲朗', last_name: '吉田', address: '山形県米沢市御廟二丁目')
    @eriko = User.create( email: 'test1@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: '絵理子', last_name: '早坂', address: '山形県米沢市御廟二丁目')
    @coco = User.create( email: 'test2@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: 'ここ', last_name: '早坂', address: '山形県米沢市御廟二丁目')

    @tankyori = Department.create(department_name: '短距離')

    @tetsu_tankyori = @tetsu.user_departments.create(department_id: @tankyori.id)
    @eriko_tankyori = @eriko.user_departments.create(department_id: @tankyori.id)
    @coco_tankyori = @coco.user_departments.create(department_id: @tankyori.id)
    login_as @tetsu
  end

  scenario 'adminは編集ページがある' do
    visit '/'
    click_link '社員ページ'
    click_link '短距離'
    click_link '早坂ここさん'
    expect(page).to have_content '早坂ここさん'
    expect(page).to have_content 'test2@test.com'
    expect(page).to have_content '山形県米沢市御廟二丁目'
    expect(page).to have_link '編集'
  end

  scenario 'not adminは編集ページが無い' do
    login_as @eriko
    visit '/'
    click_link '連絡帳'
    click_link '短距離'
    click_link '早坂ここさん'
    expect(page).to have_content '早坂ここさん'
    expect(page).to have_content 'test2@test.com'
    expect(page).to_not have_content '山形県米沢市御廟二丁目'
    expect(page).to_not have_link '編集'
  end
end
