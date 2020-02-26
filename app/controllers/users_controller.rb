class UsersController < ApplicationController
  def contracts_index
    @contracts = (current_user.lender ? current_user.loan_contracts : current_user.contracts).order(:due_date)
    @loans = current_user.loans
    @pending = @contracts.where(approved: false)
    authorize @contracts
  end
end
