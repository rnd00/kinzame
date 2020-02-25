class Contract < ApplicationRecord
  belongs_to :loan
  belongs_to :user

  validates :description, :user_id, :loan_id, presence: true

  def repaid_loan!
    self.repaid_loan = true if self.repaid_loan == false
  end

  def approve!
    self.approved = true if self.approved == false
  end

  def repaid_lender!
    self.repaid_lender = true if self.repaid_lender == false
  end

end
