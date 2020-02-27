class UsersController < ApplicationController
  def dashboard
    @contracts = (current_user.lender ? current_user.loan_contracts : current_user.contracts).order(:due_date)
    @loans = current_user.loans
    @pending = @contracts.where(approved: false, rejected: false)
    @completed = @contracts.where(repaid_loan: true)
    @paid = @contracts.where(repaid_lender: true)
    authorize @contracts
  end

  def charge_wallet
    # select the user's wallet and add the input
    current_user.wallet + params[...]
    # update the value
    current_user.update(wallet: new_wallet_amount)
  end
end
