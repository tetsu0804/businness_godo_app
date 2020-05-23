require 'rails_helper'

RSpec.feature 'Signup User', type: :feature do
  before do
    @tetsu = User.create(first_name: '哲朗', last_name: '吉田', email: 'test@test.com', address: '山形県米沢市御廟二丁目', password: 'password', password_confirmation: 'password')
  end

  scenario 'Create User' do
    login_as @tetsu

    visit '/'
    click_link 'Signup'
    fill_in '性', with: '早坂'
    fill_in '名', with: '絵理子'
    fill_in 'メールアドレス', with: 'test2@test.com'
    fill_in '住所', with: '山形県米沢市御廟二丁目'
    fill_in 'Password', with: 'password'
    fill_in 'Confirmation', with: 'password'
    click_button 'ユーザー登録'
    expect(page).to have_content '新しく早坂 絵理子さんを作成しました'
    expect(page.current_path).to eq root_path
    expect(User.count).to eq 2
  end
end
