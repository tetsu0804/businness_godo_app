require 'rails_helper'

RSpec.feature '月別ページ(what_month)', type: :feature do
  before do
    @tetsu = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true, first_name: '哲朗', last_name: '吉田', address: '山形県米沢市御廟二丁目')

    @eriko = User.create( email: 'test1@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: '絵理子', last_name: '早坂', address: '山形県米沢市御廟二丁目')

    @coco = User.create( email: 'test2@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: 'ここ', last_name: '早坂', address: '山形県米沢市御廟二丁目')

    @tankyori = Department.create(department_name: '短距離')

    UserDepartment.create(user_id: @eriko.id, department_id: @tankyori.id)
    UserDepartment.create(user_id: @coco.id, department_id: @tankyori.id)

    @yamada = TradingCompany.create(company_name: 'ヤマダ電機', address: '山形県米沢市成島町1-1-1111', tel: '0238221100')
    @yamazawanakata = TradingCompany.create(company_name: 'ヤマザワ中田店', address: '山形県米沢市中田町2-2-2222', tel: '0238232200')
    @benimalyonezawa = TradingCompany.create(company_name: 'ヨークベニマル米沢駅前店', address: '山形県米沢市駅前町3-3-3333', tel: '0238243300')

    @job_by_month = JobContent.create(title: 'ヤマダ電気配送', description: '冷蔵庫配送業務 冷蔵庫10台', start_time: 'Sat, 20 Jun 2020 10:00:00 JST +09:00', price: 1000, work_address: '山形県米沢市成島町1-1-11111', user_id: @eriko.id, department_id: @tankyori.id, trading_company_id: @yamada.id)

    @job_by_month2 = JobContent.create(title: 'ヤマザワ米沢中田店', description: '他店からの配送 商品', start_time: 'Sun, 21 Jun 2020 10:00:00 JST +09:00', price: 1000, work_address: '山形県米沢市中田町2-2-2222',user_id: @coco.id, department_id: @tankyori.id, trading_company_id: @yamazawanakata.id)

    @job_by_month3 = JobContent.create(title: 'ヨークベニマル米沢店', description: 'ヨークベニマル本社からの販促物', start_time: 'Mon, 22 Jun 2020 10:00:00 JST +09:00', price: 1000, work_address: '山形県米沢市駅前町3-3-3333', user_id: @eriko.id, department_id: @tankyori.id, trading_company_id: @benimalyonezawa.id)

    @job_next_month = JobContent.create(title: '販促物配送ヨークベニマル米沢店', description: 'ヨークベニマル本社からの販促物', start_time: 'Fri, 10 Jul 2020 10:00:00 JST +09:00', price: 1000, work_address: '山形県米沢市駅前町3-3-3333', user_id: @eriko.id, department_id: @tankyori.id, trading_company_id: @benimalyonezawa.id)

    login_as @tetsu
  end

  scenario 'what_monthページ表示' do
    visit '/'
    click_link '管理'
    click_link '今月の社員仕事一覧'
    click_link '2020年07月 (1)'
    expect(page).to have_link '販促物配送ヨークベニマル米沢店'
    expect(page).to have_link '早坂 絵理子 さん'
    expect(page).to have_link 'ヨークベニマル米沢駅前店'
    expect(page).to have_content '2020年07月10日'
    expect(page).to_not have_link 'ヤマダ電機'
    expect(page).to_not have_link 'ヤマザワ中田店'
  end
end
