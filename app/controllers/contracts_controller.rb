class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update]
  #to do: add actions for sorting
  def index
    @contracts = Contract.all
  end

  def show
  end

  def new
    @contract = Contract.new
  end

  def save
    contract = Contract.new(contract_params)
    if contract.save
      redirect_to contracts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @contract.update(user_params)
      redirect_to contract_path(@contract)
    else
      render :edit
    end
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
  end

  def contract_params
    params.require(:contract).permit(:description, :user_id, :loan_id)
  end
end
