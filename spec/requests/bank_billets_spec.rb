require 'rails_helper'

RSpec.describe BankBilletsController, type: :controller do

  context 'Get #index' do
    it 'returns status code 200' do
      get :index

      expect(response).to have_http_status(200)
    end
  end

  context 'Get #Show' do
    let(:bank_billet) { FactoryBot.create(:bank_billet) }
    
    it 'returns status code 200 and render to edit page' do
      get :show, params: { id: bank_billet.id}
    end
    
  end
end
