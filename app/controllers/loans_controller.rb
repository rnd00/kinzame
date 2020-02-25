class LoansController < ApplicationController
  before_action :set_loan, only: %i(show edit update destroy)

  def index
    @loans = Loan.all
    #but only for the user when pundit will be install
  end

  def show
  end

  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new(loan_params)
    @loan.user = current_user
    if @loan.save
      redirect_to loan_path(@loan)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @loan.update(loan_params)
      redirect_to loan_path(@loan)
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

  def set_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params
    params.require(:loan).permit(:due_date, :amount, :duration, :interest_rate)
  end

  # def total_price(loan)
  #   amount = loan.contract.amount
  #   interest = loan.contract.interest_rate.to_f / 100
  #   days = (loan.due_date - loan.created_at).to_f
  # end
end
