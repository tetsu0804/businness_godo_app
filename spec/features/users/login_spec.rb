require 'rails_helper'

RSpec.feature 'Login User', type: :feature do
  before do
    @tetsu = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true, first_name: '哲朗', last_name: '吉田', address: '山形県米沢市御廟二丁目')
  end

  scenario 'Create Login' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'test@test.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    expect(page.current_path).to eq root_path
    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content '吉田哲朗さん'
    expect(page).to have_link 'ログアウト'
    expect(page).to_not have_link 'ログイン'
  end

  scenario 'Not create Login' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'not_user@test.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    expect(page.current_path).to eq new_user_session_path
    expect(page).to have_link 'ログイン'
    expect(page).to_not have_link 'ログアウト'
    expect(page).to have_content 'Invalid Email or password.'
  end

  scenario 'Invalid Login' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: ''
    fill_in 'パスワード', with: ''
    click_button 'ログイン'
    expect(page.current_path).to eq new_user_session_path
    expect(page).to have_link 'ログイン'
    expect(page).to_not have_link 'ログアウト'
    expect(page).to have_content 'Invalid Email or password.'
  end
end
