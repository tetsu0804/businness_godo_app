require 'rails_helper'

RSpec.feature '部署一覧からUser一覧ページへ' do
  before do
    @tetsu = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true, first_name: '哲朗', last_name: '吉田', address: '山形県米沢市御廟二丁目')
    @eriko = User.create( email: 'test1@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: '絵理子', last_name: '早坂', address: '山形県米沢市御廟二丁目')
    @tankyori = Department.create(department_name: '短距離')
    @tetsu_tankyori = @tetsu.user_departments.create(department_id: @tankyori.id)
    @eriko_tankyori = @eriko.user_departments.create(department_id: @tankyori.id)
    login_as @tetsu
  end

  scenario '部署一覧からUser一覧ページへ' do
    visit '/'
    click_link '社員ページ'
    click_link '短距離'
    expect(page).to have_link '吉田哲朗さん'
    expect(page).to have_link '早坂絵理子さん'
    expect(page).to have_content '社員一覧'
  end
end
