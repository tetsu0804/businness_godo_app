require 'rails_helper'

RSpec.feature 'Show TradingCompany', type: :feature do
  before do
    @tetsu = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true, first_name: '哲朗', last_name: '吉田', address: '山形県米沢市御廟二丁目')

    @eriko = User.create( email: 'test1@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: '絵理子', last_name: '早坂', address: '山形県米沢市御廟二丁目')

    @company = TradingCompany.create(company_name: '株式会社 インテグリスジャパン', address: '山形県米沢市万世町1-1-1111', tel: '0238221100')
  end

  scenario 'Show Admin' do
    login_as @tetsu
    visit trading_company_path(@company.id)
    expect(page).to have_link '編集'
    expect(page).to have_link '削除'
  end

  scenario 'Show non-Admin' do
    login_as @eriko
    visit trading_company_path(@company.id)
    expect(page).to_not have_link '編集'
    expect(page).to_not have_link '削除'
  end
end
