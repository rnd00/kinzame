class Loan < ApplicationRecord
  belongs_to :user
  has_many :contracts

  validates :amount, :interest_rate, :duration, presence: true
  validates :duration, numericality: { only_integer: true }
  validates :amount, numericality: { only_integer: true, less_than_or_equal_to: 100000}
  validates :interest_rate, numericality: { less_than_or_equal_to: 10 }

  include PgSearch::Model
  pg_search_scope :search_by_amount,
    against: [ :amount],
    using: {
      tsearch: { prefix: true }
    }
end
