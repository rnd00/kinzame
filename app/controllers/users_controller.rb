class UsersController < ApplicationController
  def contracts_index
    @contracts = (current_user.lender ? current_user.loan_contracts : current_user.contracts).order(:due_date)
    @loans = current_user.loans
    @pending = @contracts.where(approved: false)
    @completed = @contracts.where(repaid_loan: true)
    @paid = @contract.where(repaid_lender: true)
    authorize @contracts
  end
end
