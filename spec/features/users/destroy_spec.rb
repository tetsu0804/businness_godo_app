require 'rails_helper'

RSpec.feature 'ユーザーの削除', type: :feature do
  before do
    @tetsu = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true, first_name: '哲朗', last_name: '吉田', address: '山形県米沢市御廟二丁目')
    @eriko = User.create( email: 'test1@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: '絵理子', last_name: '早坂', address: '山形県米沢市御廟二丁目')

    @coco = User.create( email: 'test2@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: 'ここ', last_name: '早坂', address: '山形県米沢市御廟二丁目')

    @kanri = Department.create(department_name: '管理部署')
    @tankyori = Department.create(department_name: '短距離')
    @tyoukyori = Department.create(department_name: '長距離')

    @tetsu_kanri = @tetsu.user_departments.create(department_id: @kanri.id)
    @eriko_tankyroi = @eriko.user_departments.create(department_id: @tankyori.id)
    @coco_tankyroi = @coco.user_departments.create(department_id: @tankyori.id)
  end

  scenario 'admin ユーザーの削除' do
    login_as @tetsu
    visit department_squeeze_path(@tankyori.id) #部署一覧ページにいる
    click_link '早坂絵理子さん'
    click_link '削除'
    expect(page).to have_content '早坂 絵理子さんを削除しました'
    expect(page.current_path).to eq departments_path
    expect(User.count).to eq 2
  end

  scenario 'not admin 削除ボタンがない' do
    login_as @eriko
    visit department_squeeze_path(@tankyori.id) #部署一覧ページにいる
    click_link '早坂ここさん'
    expect(page).to_not have_link '削除'
  end
end
