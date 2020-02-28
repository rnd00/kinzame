class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :contracts
  has_many :loans
  has_many :loan_contracts, through: :loans, source: :contracts
  has_one_attached :photo

  validates :first_name, :last_name, presence: true
  validates :wallet, numericality: { only_integer: true }

  def has_loan?
    self.contracts.where(repaid_loan: true).empty?
  end

  def become_lender!
    self.lender = true
    self.save
  end

  def money_available
    total_amount = loans.joins(:contracts).where('repaid_loan = false AND approved = true').sum(&:amount)
    self.wallet - total_amount
  end

  # def substract_approved(loan)
  #   self.wallet - loan.amount
  #   self.save
  # end
end
