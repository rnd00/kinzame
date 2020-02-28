class ContractPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # Index - A user should be able to see ONLY his contracts.
  # Show - A user should be able to see ONE of his contracts.
  # New - You must be a lender to create a contract AND you must dont have active contracts.
  # Create - ( && user.no_loan?)
  # approve! - Only a lender can approve his own contract.
  # repaid_lender - Only a borrower can approve his own contract(attached to him)
  # repaid_loan - Only a lender can approve his own contract.

  def new?
    true
  end

  def show?
    record.user == user || user.admin
  end

  def create?
    user.has_loan? || user.admin
  end

  def approve?
    user.lender && record.loan.user == user || user.admin
  end

  def repaid_lender?
    record.user == user || user.admin
  end

  def repaid_loan?
    user.lender && record.loan.user == user || user.admin
  end

  def dashboard?
    true
  end

  def rejected?
    user.lender
  end
end


