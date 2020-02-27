class Loan < ApplicationRecord
  belongs_to :user
  has_many :contracts

  validates :amount, :interest_rate, :duration, presence: true
  validates :duration, numericality: { only_integer: true }
  validates :amount, :interest_rate, numericality: true

  include PgSearch::Model
  pg_search_scope :search_by_amount,
    against: [ :amount],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
