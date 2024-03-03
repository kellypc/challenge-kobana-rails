class BankBilletsController < ApplicationController
  def index
    @bank_billets = BankBillet.all
  end
end
    