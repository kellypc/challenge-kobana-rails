require 'rails_helper'

RSpec.describe BankBillet, type: :model do
  describe 'validations' do
    context 'with a valid bank billet' do
      let(:bank_billet) { FactoryBot.build(:bank_billet) }
      
      it 'should be valid' do
        expect(bank_billet).to be_valid
      end  
    end
    
    context 'without a customer person name' do
      let(:user) { FactoryBot.build(:bank_billet, customer_person_name: nil) }
      
      it 'should not be valid' do
        expect(user).not_to be_valid
      end  
    end

    context 'without a customer cnpj_cpf' do
      let(:user) { FactoryBot.build(:bank_billet, customer_cnpj_cpf: nil) }
      
      it 'should not be valid' do
        expect(user).not_to be_valid
      end  
    end

    context 'without a customer state' do
      let(:user) { FactoryBot.build(:bank_billet, customer_state: nil) }
      
      it 'should not be valid' do
        expect(user).not_to be_valid
      end  
    end

    context 'without a customer city name' do
      let(:user) { FactoryBot.build(:bank_billet, customer_city_name: nil) }
      
      it 'should not be valid' do
        expect(user).not_to be_valid
      end  
    end

    context 'without a customer zip code' do
      let(:user) { FactoryBot.build(:bank_billet, customer_zipcode: nil) }
      
      it 'should not be valid' do
        expect(user).not_to be_valid
      end  
    end

    context 'without a customer address' do
      let(:user) { FactoryBot.build(:bank_billet, customer_address: nil) }
      
      it 'should not be valid' do
        expect(user).not_to be_valid
      end  
    end

    context 'without a customer address neighborhood' do
      let(:user) { FactoryBot.build(:bank_billet, customer_address_neighborhood: nil) }
      
      it 'should not be valid' do
        expect(user).not_to be_valid
      end  
    end
  end
end
