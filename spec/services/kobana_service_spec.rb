require 'rails_helper'
require 'uri'
require 'net/http'

RSpec.describe KobanaService do
  describe '#create_bank_billet' do
    context 'when creating a new bank billet at Kobana' do
      let(:bank_billet) { FactoryBot.create(:bank_billet) }
      
      it "saves the kobana id in the bank billet" do
        VCR.use_cassette('kobana/create_bank_billet') do
          described_class.new(bank_billet).create_bank_billet
        end

        expect(bank_billet.kobana_id).to_not be_nil
      end
    end
  end

  describe "#find_bank_billet" do 
    context "when request a billet at kobana" do
      let(:bank_billet) { FactoryBot.create(:bank_billet) }

      it "receive a response body with parameters" do
        VCR.use_cassette('kobana/find_bank_billet') do
          response = described_class.new(bank_billet).find_bank_billet
          
          expect(response[0]["customer_person_name"]).to eq("Ester Francisca Clara Melo")
        end
      end
    end
  end
end
