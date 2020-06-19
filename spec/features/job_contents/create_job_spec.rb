require 'rails_helper'

RSpec.feature 'Create Job Content', type: :feature do
  before do
    @tetsu = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true, first_name: '哲朗', last_name: '吉田', address: '山形県米沢市御廟二丁目')

    @eriko = User.create( email: 'test1@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: '絵理子', last_name: '早坂', address: '山形県米沢市御廟二丁目')



    @coco = User.create( email: 'test2@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: 'ここ', last_name: '早坂', address: '山形県米沢市御廟二丁目')

    @tankyori = Department.create(department_name: '短距離')

    @eriko_tankyori = UserDepartment.create(user_id: @eriko.id, department_id: @tankyori.id)

    login_as @tetsu
  end

  scenario '成功', js: true do
    visit '/'
    click_link '管理'
    click_link '仕事作成'
    select '短距離', from: 'job_content[department_id]'
    select '早坂 絵理子 さん', from: 'job_content[user_id]'
    select '2020', from: 'job_content[start_time(1i)]'
    select '6', from: 'job_content[start_time(2i)]'
    select '20', from: 'job_content[start_time(3i)]'
    select '10', from: 'job_content[start_time(4i)]'
    select '00', from: 'job_content[start_time(5i)]'
    fill_in 'job_content[title]', with: '引越し業務'
    fill_in 'job_content[description]', with: 'ドナルドトランプさんの引越し作業、アメリカの大統領なので貴重品多数あり。丁寧に扱う事。損失、傷などを付けると国家危機'
    fill_in 'job_content[work_address]', with: '東京都港区'
    fill_in 'job_content[price]', with: 100000

    click_button '作成'
    expect(page).to have_content '仕事作成送信しました。'
    expect(page.current_path).to eq root_path
    expect(JobContent.count).to eq 1
  end

  scenario '失敗', js: true do
    visit '/'
    click_link '管理'
    click_link '仕事作成'
    select '短距離', from: 'job_content[department_id]'
    select '早坂 絵理子 さん', from: 'job_content[user_id]'
    fill_in 'job_content[title]', with: ''
    fill_in 'job_content[description]', with: ''
    fill_in 'job_content[work_address]', with: ''
    fill_in 'job_content[price]', with: ''

    click_button '作成'
    expect(page).to have_content '仕事作成送信失敗しました。'
    expect(JobContent.count).to eq 0
    expect(page.current_path).to eq '/job_contents'
  end
end
