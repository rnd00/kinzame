class Contract < ApplicationRecord
  belongs_to :loan
  belongs_to :user

  validates :description, :user_id, :loan_id, presence: true
  validate :borrwer_and_lender_not_same

  def repaid_loan!
    self.repaid_loan = true
  end

  def approve!
    self.approved = true
  end

  def repaid_lender!
    self.repaid_lender = true
  end

  def rejected!
    self.rejected = true
  end

  private

  def borrower_and_lender_not_same
    errors.add(:user, "borrower and lender can't be the same") if email == password
  end
end
#wakadlkas
