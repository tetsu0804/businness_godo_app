require 'rails_helper'

RSpec.feature 'Signup User', type: :feature do
  before do
    @tetsu = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true)
  end

  scenario 'Create User' do
    login_as @tetsu

    visit '/'
    click_link '管理者ページ'
    within first('tbody td') do
      click_link 'Users'
    end
    click_link 'Add new'
    #fill_in , with: '早坂'
    # fill_in '名', with: '絵理子'
    fill_in 'Email', with: 'test2@test.com'
    #fill_in '住所', with: '山形県米沢市御廟二丁目'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    uncheck 'Admin'
    click_button 'Save'
    #expect(page).to have_content '新しく早坂 絵理子さんを作成しました'
    #expect(page.current_path).to eq root_path
    expect(User.count).to eq 2
  end
end
#first_name: '哲朗', last_name: '吉田',address: '山形県米沢市御廟二丁目',
