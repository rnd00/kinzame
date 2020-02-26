class UsersController < ApplicationController
  def contracts_index
    @contracts = current_user.lender ? current_user.loan_contracts : current_user.contracts
    authorize @contracts
  end
end
