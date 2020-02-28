class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def add_in_wallet?
    true
  end

  def subtract_wallet?
    true
  end

  def wallet?
    true
  end

  def become_lender?
    # !user.has_loan?
    true
  end
end
