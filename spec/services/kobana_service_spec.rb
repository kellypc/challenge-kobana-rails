require 'rails_helper'
require 'uri'
require 'net/http'

RSpec.describe KobanaService do
  describe '#call' do
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
end
