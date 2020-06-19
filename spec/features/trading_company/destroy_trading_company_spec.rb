require 'rails_helper'

RSpec.feature 'Destroy 取引会社', type: :feature do
  before do
    @tetsu = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true, first_name: '哲朗', last_name: '吉田', address: '山形県米沢市御廟二丁目')

    @company = TradingCompany.create(company_name: '株式会社 インテグリスジャパン', address: '山形県米沢市万世町1-1-1111', tel: '0238221100')
    login_as @tetsu
  end

  scenario 'Destroy 成功', js: true do
    visit '/'
    click_link '管理'
    click_link '取引会社一覧'
    click_link '株式会社 インテグリスジャパン'
    click_link '削除'
    expect(page).to have_content '株式会社 インテグリスジャパンを削除しました。'
    expect(page.current_path).to eq trading_companys_path
    expect(TradingCompany.count).to eq 0
  end
end
