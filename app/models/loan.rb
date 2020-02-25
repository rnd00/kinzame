class Loan < ApplicationRecord
  belongs_to :user

  validates :amount, :interest_rate, :duration, presence: true
  validates :duration, numericality: { only_integer: true }
  validates :amount, :interest_rate, numericality: true
end
