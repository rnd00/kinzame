class LoansController < ApplicationController
  before_action :set_loan, only: %i(show edit update destroy)
  skip_before_action :authenticate_user!, only: %i(index show)

  def index
    @loans = policy_scope(Loan)
    #but only for the user when pundit will be install
  end

  def show
    authorize @loan
  end

  def new
    @loan = Loan.new
    authorize @loan
  end

  def create
    @loan = Loan.new(loan_params)
    authorize @loan
    @loan.user = current_user
    if @loan.save
      redirect_to loan_path(@loan)
    else
      render :new
    end
  end

  def edit
    authorize @loan
  end

  def update
    authorize @loan
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
    authorize @loan
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

end
