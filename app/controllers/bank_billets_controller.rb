class BankBilletsController < ApplicationController
  before_action :set_bank_billet, only: [:show]
  
  def index
    @bank_billets = BankBillet.all
  end

  def show
  end

  private

  def set_bank_billet
    @bank_billet = BankBillet.find(params[:id])
  end
  
end
    