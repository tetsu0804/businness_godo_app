require 'rails_helper'

RSpec.describe "WorkBooks", type: :request do
  before do
    @eriko = User.create( email: 'test1@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: '絵理子', last_name: '早坂', address: '山形県米沢市御廟二丁目')
    login_as @eriko
  end

  describe 'GET /work_books' do
    before { get '/work_books' }
    it 'Adminでは無いユーザーの場合はアクセスできない' do
      expect(response.status).to eq 302
      flash_message = '管理者権限が無いためアクセスできません'
      expect(flash[:danger]).to eq flash_message
    end
  end

  describe 'GET /users/:user_id/booking' do
    before { get "/users/#{@eriko.id}/booking"}
    it 'Adminでは無いユーザーの場合はアクセスできません' do
      expect(response.status).to eq 302
      flash_message = '管理者権限が無いためアクセスできません'
      expect(flash[:danger]).to eq flash_message
    end
  end
end
