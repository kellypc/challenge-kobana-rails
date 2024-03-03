require 'rails_helper'

RSpec.describe BankBilletsController, type: :controller do

  context "Get #index" do
    it "does have index page" do
      get :index

      expect(response).to have_http_status(200)
    end
  end
end
