class BankBilletsController < ApplicationController
  before_action :set_bank_billet, only: [:show, :update, :edit, :destroy]
  
  def index
    @bank_billets = BankBillet.all
  end

  def show
    @bank_billet_details = KobanaService.new(@bank_billet).find_bank_billet
  end

  def new
    @bank_billet = BankBillet.new
  end

  def create
    @bank_billet = BankBillet.new(bank_billet_params)

    if @bank_billet.save
      KobanaService.new(@bank_billet).create_bank_billet

      flash[:success] = "Object successfully created"
      redirect_to @bank_billet
    else
      flash[:error] = "Something went wrong"
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @bank_billet = BankBillet.find(params[:id])
  end

  def update
    if @bank_billet.update(bank_billet_params)
      redirect_to @bank_billet
    else
      render json: @bank_billet.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @bank_billet.destroy
    
    redirect_to root_path, status: :see_other
  end

  private

  def set_bank_billet
    @bank_billet = BankBillet.find(params[:id])
  end

  def bank_billet_params
    params.require(:bank_billet).permit(:amount, :expire_at, :customer_person_name, :customer_cnpj_cpf, :customer_state,
                                         :customer_city_name, :customer_zipcode, 
                                         :customer_address, :customer_address_neighborhood)
  end
end
    