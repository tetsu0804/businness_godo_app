require 'rails_helper'

RSpec.feature '取引会社作成', type: :feature do
  before do
    @tetsu = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true, first_name: '哲朗', last_name: '吉田', address: '山形県米沢市御廟二丁目')

    login_as @tetsu
  end

  scenario 'Create 取引会社' do
    visit '/'
    click_link '取引会社作成'
    fill_in 'trading_company[company_name]', with: 'ヤマダ電気'
    fill_in 'trading_company[address]', with: '山形県米沢市成島町1-1-11111'
    fill_in 'trading_company[tel]', with: '0238221100'
    click_button '作成'
    expect(page).to have_content '取引会社を作成しました。'
    expect(page.current_path).to eq '/trading_companys/1'
    expect(TradingCompany.count).to eq 1
    expect(page).to have_link '取引会社一覧'
  end
end
