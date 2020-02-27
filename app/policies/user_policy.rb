class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def charge_wallet?
    true
  end

  def wallet?
    true
  end

  def become_lender?
    user.no_loan?
  end
end
