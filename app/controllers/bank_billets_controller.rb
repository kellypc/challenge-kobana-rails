class BankBilletsController < ApplicationController
  before_action :set_bank_billet, only: [:show]
  
  def index
    @bank_billets = BankBillet.all
  end

  def show
  end

  def new
    @bank_billet = BankBillet.new
  end

  def create
    @bank_billet = BankBillet.new(bank_billet_params)

    if @bank_billet.save
      flash[:success] = "Object successfully created"
      redirect_to @bank_billet, status: :created
    else
      flash[:error] = "Something went wrong"
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def set_bank_billet
    @bank_billet = BankBillet.find(params[:id])
  end

  private

  def bank_billet_params
    params.require(:bank_billet).permit(:amount, :expire_at, :customer_person_name, :customer_cnpj_cpf, :customer_state,
                                         :customer_city_name, :customer_zipcode, 
                                         :customer_address, :customer_address_neighborhood)
  end
end
    