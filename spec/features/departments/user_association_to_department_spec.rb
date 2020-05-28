require 'rails_helper'

RSpec.feature 'ユーザーと部署の関連付け', type: :feature do
  # before do
  #   @tetsu = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true, first_name: '哲朗', last_name: '吉田', address: '山形県米沢市御廟二丁目')
  #   @tankyori = Department.create(department_name: '短距離')
  #   @tyoukyori = Department.create(department_name: '長距離')
  #   @jimu = Department.create(department_name: '事務')
  #
  #   login_as @tetsu
  # end
  #
  # scenario '関連作成' do
  #   visit '/'
  #   click_link '社員ページ'
  #   click_link '部署異動リンク'
  #   check '短距離'
  #   click_button '編集'
  #   expect(page.current_path).to eq departments_path
  #   expect(page).to have_content '部署を変更しました'
  # end
end
