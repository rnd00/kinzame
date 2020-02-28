class UsersController < ApplicationController
  def dashboard
    @contracts = (current_user.lender ? current_user.loan_contracts : current_user.contracts).order(:due_date)
    @loans = current_user.loans
    @pending = @contracts.where(approved: false, rejected: false)
    @completed = @contracts.where(repaid_loan: true)
    @paid = @contracts.where(repaid_lender: true, repaid_loan: false)
    #Add by Adil
    @borrower_active = @contracts.where(approved: true, repaid_lender: false)
    @borrower_history = @contracts.where(repaid_lender:true)
    authorize @contracts
  end

  def add_in_wallet
    authorize current_user
    new_wallet = user_params[:wallet].to_i + user_params[:old_wallet].to_i
    current_user.update(wallet: new_wallet)
    redirect_to dashboard_path
  end

  # def repaid_loan_wallet(loan)
  # end

  # def subtract_wallet
  #   authorize current_user
  #   new_wallet = user_params[:wallet].to_i - user_params[:old_wallet].to_i
  #   current_user.update(wallet: new_wallet)
  #   redirect_to dashboard_path
  # end

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
    params.require(:user).permit(:wallet, :old_wallet)
  end

end
