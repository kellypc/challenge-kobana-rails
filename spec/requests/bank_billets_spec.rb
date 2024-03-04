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

  context 'Post #create' do
    it 'returns created status' do
      params = {
        amount: 2.0,
        expire_at: "2024-03-02",
        customer_person_name: "Myperson name",
        customer_cnpj_cpf: "My person cpf",
        customer_state: "Myperson state",
        customer_city_name: "MyString",
        customer_zipcode: "MyString",
        customer_address: "MyString",
        customer_address_neighborhood: "MyString"
      }

      expect { post(:create, params: { bank_billet: params })}.to change(BankBillet, :count).by(1)
      expect(response).to have_http_status(:created)
    end

    context 'PUT #update' do
      let(:bank_billet) { FactoryBot.create(:bank_billet) }
      
      it 'is expected to update bank_billet ' do
        params = {
          amount: 2.0,
          expire_at: "2024-12-10",
          customer_person_name: "Claudio Duarte",
          customer_cnpj_cpf: "49125659030",
          customer_state: "Myperson state",
          customer_city_name: "MyString",
          customer_zipcode: "MyString",
          customer_address: "MyString",
          customer_address_neighborhood: "MyString"
        }

        put :update, params: { id: bank_billet.id, bank_billet: params }
        bank_billet.reload

        expect(bank_billet).to eq(params)
      end
    end

    context 'DELETE #destroy' do
      let(:bank_billet) { FactoryBot.create(:bank_billet) }

      it 'should delete bank_billet' do
        bank_billet.delete
       
        expect(response).to have_http_status(:see_other)
      end
    end
  end
end
