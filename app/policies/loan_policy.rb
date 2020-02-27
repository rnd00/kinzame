class LoanPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # Index = Anyone can see all the loans available before login.
  # Show = Anyone can see one loan before login.
  # New = Anyone car create a new loan IF
  # => the user is a lender && don't have an active contract as the borrower.
  # Create = If new, then create
  # Edit = Only the owner of the loan can edit
  # Update = Same as Edit
  # Destroy = Only the owner can destroy a loan.

  def show?
    user_is_owner_or_admin?
  end

  def create?
    user.lender || user.admin
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  def user_is_owner_or_admin?
    record.user == user || user.admin
  end

  def results?
    true
  end
end
