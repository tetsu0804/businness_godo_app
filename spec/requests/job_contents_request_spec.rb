require 'rails_helper'

RSpec.describe "JobContents", type: :request do
  before do
    @eriko = User.create( email: 'test1@test.com', password: 'password', password_confirmation: 'password', admin: false, first_name: '絵理子', last_name: '早坂', address: '山形県米沢市御廟二丁目')
    login_as @eriko
  end

  describe 'GET /job_contents/new' do
    before { get '/job_contents/new' }
    it 'Adminでは無いユーザーの場合はアクセスできない' do
      expect(response.status).to eq 302
      flash_message = '管理者権限が無いためアクセスできません'
      expect(flash[:danger]).to eq flash_message
    end
  end

  describe 'POST /select_user' do
    before { post '/select_user' }
    it 'Adminでは無いユーザーの場合はアクセスできない' do
      expect(response.status).to eq 302
      flash_message = '管理者権限が無いためアクセスできません'
      expect(flash[:danger]).to eq flash_message
    end
  end

  describe 'GET /by_month' do
    before { get '/by_month' }
    it 'Adminでは無いユーザーの場合はアクセスできない' do
      expect(response.status).to eq 302
      flash_message = '管理者権限が無いためアクセスできません'
      expect(flash[:danger]).to eq flash_message
    end
  end

  describe 'GET /what_month' do
    before { get '/what_month/:month' }
    it 'Adminでは無いユーザーの場合はアクセスできない' do
      expect(response.status).to eq 302
      flash_message = '管理者権限が無いためアクセスできません'
      expect(flash[:danger]).to eq flash_message
    end
  end
end
