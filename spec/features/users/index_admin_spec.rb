require 'rails_helper'

RSpec.feature 'Index User', type: :feature do
  before do
    @tetsu = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true, first_name: '哲朗', last_name: '吉田', address: '山形県米沢市御廟二丁目')

    login_as @tetsu

    @eriko = User.create( email: 'test1@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: '絵理子', last_name: '早坂', address: '山形県米沢市御廟二丁目')

    @coco = User.create( email: 'test2@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: 'ここ', last_name: '早坂', address: '山形県米沢市御廟二丁目')
  end

  scenario 'admin user' do
    # visit '/'
    # click_link '社員ページ'
    # expect(page).to have_link '早坂 絵理子'
    # expect(page).to have_link '早坂 ここ'
    # expect(page.current_path).to eq users_path
  end
end
