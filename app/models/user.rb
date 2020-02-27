class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :contracts
  has_many :loans
  has_many :loan_contracts, through: :loans, source: :contracts

  validates :first_name, :last_name, presence: true
  validates :wallet, numericality: { only_integer: true }

  def no_loan?
    self.contracts.where(repaid_loan: true).empty?
  end

  def money_available
    # Select the user's wallet
    # Setup a money_lend variable with inside => iteration of addition of every loan.amount
    # select actual wallet's value and substract money_lend
    money_lend = 0

    current_user.loans do |loan|
      money_lend += loan.amount.where(repaid_lender = false)
    end
    current_user.wallet - money_lend
  end
end
