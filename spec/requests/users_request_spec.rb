require 'rails_helper'

RSpec.describe "Users", type: :request do
  before do
    @non_admin = User.create(email: 'test1@test.com', password: 'password', password_confirmation: 'password', first_name: '絵理子', last_name: '早坂', address: '山形県御廟', admin: false)
  end

  describe 'GET root_path' do
    before { get '/' }
    it 'non signed_in user' do
      expect(response.status).to eq 302
      flash_message = 'アカウント登録もしくはログインしてください。'
      expect(flash[:alert]).to eq flash_message
    end
  end

  describe 'GET /admin' do
    before do
      login_as @non_admin
      get '/admin'
    end
    it 'non user.admin?' do
      expect(response.status).to eq 302
      flash_message = 'You are not authorized to access this page.'
      expect(flash[:alert]).to eq flash_message
    end
  end
end
