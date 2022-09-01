# frozen_string_literal: true

require('rails_helper')

describe 'Auth Registration API' do
  it 'ユーザ新規登録が完了する' do
    expect {
      post '/api/v1/auth', params: {
        name: 'customer',
        email: 'customer@example.com',
        password: 'password',
        password_confirmation: 'password',
        confirm_success_url: 'https://www.google.com'
      } }.to change(User, :count).by(1)

    expect(response.status).to eq(200)
  end
end
