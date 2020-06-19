require 'rails_helper'

RSpec.feature 'Edit 取引会社', type: :feature do
  before do
    @tetsu = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true, first_name: '哲朗', last_name: '吉田', address: '山形県米沢市御廟二丁目')

    @company = TradingCompany.create(company_name: '株式会社 インテグリスジャパン', address: '山形県米沢市万世町1-1-1111', tel: '0238221100')
    login_as @tetsu
  end

  scenario 'Edit 成功',js: true do
    visit '/'
    click_link '管理'
    click_link '取引会社一覧'
    click_link '株式会社 インテグリスジャパン'
    click_link '編集'
    fill_in 'trading_company[company_name]', with: '株式会社 インテグリスジャパン'
    fill_in 'trading_company[address]', with: '山形県米沢市御廟2-111'
    fill_in 'trading_company[tel]', with: '0238221100'
    click_button '編集'
    expect(page).to have_content '株式会社 インテグリスジャパンを編集しました。'
    expect(page.current_path).to eq trading_company_path(@company.id)
    expect(page).to have_content '山形県米沢市御廟2-111'
  end
end
