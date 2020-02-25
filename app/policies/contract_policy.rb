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
  # Edit -

end


