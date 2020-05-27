require 'rails_helper'

RSpec.feature '部署一覧', type: :feature do
  before do
    @tetsu = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true, first_name: '哲朗', last_name: '吉田', address: '山形県米沢市御廟二丁目')
    login_as @tetsu
  end

  scenario '部署一覧画面に部署作成リンクがある' do
    visit '/'
    click_link '社員ページ'
    expect(page).to have_link '部署作成リンク'
  end

  scenario '部署一覧がある' do
    department = Department.create(department_name: '短距離')

    visit '/'
    click_link '社員ページ'
    expect(page).to have_link '短距離'
  end
end
