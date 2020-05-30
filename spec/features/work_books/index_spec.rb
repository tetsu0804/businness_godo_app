require 'rails_helper'

RSpec.feature '勤務簿一覧',type: :feature do
  before do
    @tetsu = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true, first_name: '哲朗', last_name: '吉田', address: '山形県米沢市御廟二丁目')
    @one = @tetsu.work_books.create(paid: false)
    @one_update = @one.update_attributes(updated_at: Time.zone.now)
    @two = @tetsu.work_books.create(paid: false)
    @two_update = @two.update_attributes(updated_at: Time.zone.now)
    @three = @tetsu.work_books.create(paid: false)
    @three_update = @three.update_attributes(updated_at: Time.zone.now)
    login_as @tetsu
  end

  scenario '成功' do
    visit '/'
    click_link '勤務一覧'
    expect(page).to have_content '吉田哲朗さん'
    expect(page).to have_content @one.created_at.strftime('%H時%M分')
    expect(page).to have_content @one.updated_at.strftime('%H時%M分')
    expect(page).to have_content @two.created_at.strftime('%H時%M分')
    expect(page).to have_content @two.updated_at.strftime('%H時%M分')
    expect(page).to have_content @three.created_at.strftime('%H時%M分')
    expect(page).to have_content @three.updated_at.strftime('%H時%M分')
  end

end
