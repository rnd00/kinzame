class Contract < ApplicationRecord
  belongs_to :loan
  belongs_to :user
  has_many_attached :photo

  validates :description, :user_id, :loan_id, presence: true

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
end
