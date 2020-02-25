class LoansController < ApplicationController
  before_action :find_loan, only %i(show edit update)

  def index
    @loans = Loan.all
    #but only for the user when pundit will be install
  end

  def show
  end

  def new
    @loan = Loan.new
    @path = ''
  end

  def create
    @loan = Loan.new(params_loan)
    @contract = Contract.find(params[:contract_id])
    @loan.contract = @contract

    if @loan.save
      redirect_to loan_path(@loan)
    else
      render "contracts/show"
    end
  end

  def edit
  end

  def update
    if @loan.update(params_loan)
      redirect_to
    else
      render :edit
    end
  end

  def accepted
    loan = find_loan
    loan.accepted = true
    loan.save!
    redirect_to loan_path(@loan)
  end

  def declined
    loan = find_loan
    loan.accepted = false
    loan.save!
    redirect_to loans_path
  end

  def destroy
    @loan.destroy
    redirect_to loans_path
  end

  private

  def find_loan
    Loan.find(params[:id])
  end

  def params_loan
    params.require(:loan).permit(:due_date,)
  end

  # def total_price(loan)
  #   amount = loan.contract.amount
  #   interest = loan.contract.interest_rate.to_f / 100
  #   days = (loan.due_date - loan.created_at).to_f
  # end
end
