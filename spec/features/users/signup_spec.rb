require 'rails_helper'

RSpec.feature 'Signup User', type: :feature do
  # before do
  #   @tetsu = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true, first_name: '哲朗', last_name: '吉田', address: '山形県米沢市御廟二丁目')
  # end
  #
  # scenario 'Create User' do
  #   login_as @tetsu
  #
  #   visit '/'
  #   click_link '管理者ページ'
  #   within ('tbody td a') do
  #     click_link 'User'
  #   end
  #   click_link 'Translation missing: ja.admin.actions.new.menu'
  #   fill_in 'Email', with: 'test2@test.com'
  #   fill_in 'Password', with: 'password'
  #   fill_in 'Password confirmation', with: 'password'
  #   uncheck 'Admin'
  #   fill_in 'First name', with: '絵理子'
  #   fill_in 'Last name', with: '早坂'
  #   fill_in 'Address', with: '山形県米沢市御廟二丁目'
  #   click_button 'Save'
  #   expect(page.current_path).to eq  '/admin/user'
  #   expect(page).to have_content 'translation missing: ja.admin.flash.successful'
  #   expect(User.count).to eq 2
  # end
  #
  # scenario 'Not created User' do
  #   coco = User.create(email: 'test1@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: 'ここ', last_name: '早坂', address: '山形県米沢市御廟二丁目')
  #   login_as coco
  #   visit '/'
  #   expect(page).to_not eq '管理者ページ'
  # end
  #
  # scenario 'Invalid created User' do
  #   login_as @tetsu
  #   visit '/'
  #   click_link '管理者ページ'
  #   within first('tbody td') do
  #     click_link 'User'
  #   end
  #   click_link 'Translation missing: ja.admin.actions.new.menu'
  #   fill_in 'Email', with: ''
  #   fill_in 'Password', with: ''
  #   fill_in 'Password confirmation', with: ''
  #   uncheck 'Admin'
  #   fill_in 'First name', with: ''
  #   fill_in 'Last name', with: ''
  #   fill_in 'Address', with: ''
  #   click_button 'Save'
  #   expect(User.count).to eq 1
  #end
end
#first_name: '哲朗', last_name: '吉田',address: '山形県米沢市御廟二丁目',
