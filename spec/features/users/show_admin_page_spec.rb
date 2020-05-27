require 'rails_helper'

RSpec.feature 'Show Users', type: :feature do
  before do
    @tetsu = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true, first_name: '哲朗', last_name: '吉田', address: '山形県米沢市御廟二丁目')
    login_as @tetsu
    @eriko = User.create( email: 'test1@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: '絵理子', last_name: '早坂', address: '山形県米沢市御廟二丁目')
  end

  scenario 'MyProfile Page' do
    visit '/'
    click_link '吉田哲朗さん'
    expect(page).to have_content '吉田哲朗'
    expect(page).to have_content 'test@test.com'
    expect(page).to have_content '山形県米沢市御廟二丁目'
  end

  scenario 'Other User Show' do
    visit '/'
    click_link '社員ページ'
    click_link '早坂 絵理子'
    expect(page).to have_content '早坂絵理子さん'
    expect(page).to have_content 'test1@test.com'
    expect(page).to have_content '山形県米沢市御廟二丁目'
  end
end
