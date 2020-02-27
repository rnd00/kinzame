class UsersController < ApplicationController
  def dashboard
    @contracts = (current_user.lender ? current_user.loan_contracts : current_user.contracts).order(:due_date)
    @loans = current_user.loans
    @pending = @contracts.where(approved: false, rejected: false)
    @completed = @contracts.where(repaid_loan: true)
    @paid = @contracts.where(repaid_lender: true, repaid_loan: false)
    #Add by Adil
    @borrower_active = @contracts.where(approved: true)
    @borrower_history = @contracts.where(repaid_lender:true)
    authorize @contracts
  end

  def charge_wallet
    # update the value
    # redirect
    authorize current_user
    current_user.update(user_params)
    redirect_to dashboard_path
  end

  def wallet
    authorize current_user
  end

  def become_lender
    authorize current_user
    current_user.become_lender!
    redirect_to dashboard_path
  end

  private

  def user_params
    params.require(:user).permit(:wallet)
  end

end
