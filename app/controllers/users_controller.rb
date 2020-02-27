class UsersController < ApplicationController
  def dashboard
    @contracts = (current_user.lender ? current_user.loan_contracts : current_user.contracts).order(:due_date)
    @loans = current_user.loans
    @pending = @contracts.where(approved: false, rejected: false)
    @completed = @contracts.where(repaid_loan: true)
    @paid = @contracts.where(repaid_lender: true)
    authorize @contracts
  end
end
