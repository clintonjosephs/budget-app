require 'rails_helper'

RSpec.describe ExpensesController, type: :request do
  describe 'Get create expense form' do
    before(:example) { get new_expense_path }
    it 'returns http found' do
      expect(response).to have_http_status(:found)
    end

    it 'should be redirected to splashscreen' do
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
