require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  let(:password) { 'aAbBcCdD1234' }
  let(:user) { create(:user, password:) }

  describe 'POST /api/sessions' do
    context 'with correct credentials' do
      it 'logs in an existing user' do
        post '/api/sessions', params: { user: { email: user.email, password: user.password } }
        expect(response).to have_http_status(:ok)
      end

      it 'returns an session cookie' do
        post '/api/sessions', params: { user: { email: user.email, password: user.password } }
        expect(response.cookies['_session_id']).not_to be_empty
      end
    end

    context 'with incorrect password' do
      it 'does not log in an existing user' do
        post '/api/sessions', params: { user: { email: user.email, password: 'incorrect-password' } }
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns JSON response with errors' do
        post '/api/sessions', params: { user: { email: user.email, password: 'incorrect-password' } }
        expect(response.body).to eq({ errors: ['Incorrect credentials.'] }.to_json)
      end

      it 'does not return a session cookie' do
        post '/api/sessions', params: { user: { email: user.email, password: 'incorrect-password' } }
        expect(response.cookies['_session_id']).to be_nil
      end
    end
  end

  describe 'DELETE /api/sessions' do
    it 'resets the session' do
      delete '/api/sessions'
      expect(response).to have_http_status(:ok)
    end
  end
end
