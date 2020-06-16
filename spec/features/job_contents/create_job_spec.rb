require 'rails_helper'

RSpec.feature 'Create Job Content', type: :feature do
  before do
    @tetsu = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true, first_name: '哲朗', last_name: '吉田', address: '山形県米沢市御廟二丁目')

    @eriko = User.create( email: 'test1@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: '絵理子', last_name: '早坂', address: '山形県米沢市御廟二丁目')

    @coco = User.create( email: 'test2@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: 'ここ', last_name: '早坂', address: '山形県米沢市御廟二丁目')

    login_as @tetsu
  end

  scenario '成功' do
    visit '/'
    click_link '仕事作成'
    select '早坂絵理子さん', from: '長距離'
    fill_in 'job_content[title]', with: '引越し業務'
    fill_in 'job_content[description]', with: 'ドナルドトランプさんの引越し作業、アメリカの大統領なので貴重品多数あり。丁寧に扱う事。損失、傷などを付けると国家危機'
    fill_in 'job_content[work_address]', with: '東京都港区'
    fill_in 'job_content[price]', with: 100000
  end
end
