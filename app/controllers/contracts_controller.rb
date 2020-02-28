class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update]
  before_action :set_loan, only: [:new, :create, :edit, :update]
  skip_before_action :authenticate_user!, only: %i(index)
  #to do: add actions for sorting

  def show
    authorize @contract
  end

  def new
    @contract = Contract.new
    authorize @contract
  end

  def create
    @contract = Contract.new(contract_params)
    authorize @contract
    @contract.loan = @loan
    @contract.user = current_user
    if @contract.save
      redirect_to contract_path(id: @contract.id)
      flash[:notice] = "Your request has been made"
    else
      render :new
    end
  end

  def edit
    authorize @contract
  end

  def update
    authorize @contract
    if @contract.update(contract_params)
      redirect_to contract_path(id: @contract.id)
    else
      render :edit
    end
  end

  def repaid_loan
    @contract = Contract.find(params[:contract_id])
    authorize @contract
    @contract.repaid_loan!
    @contract.save
    redirect_to dashboard_path
  end

  def approve
    @contract = Contract.find(params[:contract_id])
    authorize @contract
    @contract.approve!
    @contract.save
    # subtract_approved(@contract)
    redirect_to dashboard_path
    flash[:notice] = "Loan Approved"
  end

  # def subtract_approved(contract)
  #   new_wallet_amount = current_user.wallet - contract.loan.amount
  #   current_user.update(wallet: new_wallet_amount)
  # end

  def repaid_lender
    @contract = Contract.find(params[:contract_id])
    authorize @contract
    @contract.repaid_lender!
    @contract.save
    redirect_to dashboard_path
  end

  def rejected
    @contract = Contract.find(params[:contract_id])
    authorize @contract
    @contract.rejected!
    @contract.save
    redirect_to dashboard_path
    flash[:notice] = "Loan Rejected"
  end

  private

  def set_loan
    @loan = Loan.find(params[:loan_id])
  end

  def set_contract
    @contract = Contract.find(params[:id])
  end

  def contract_params
    params.require(:contract).permit(:description, :user_id, :loan_id, :photo)
  end
end
