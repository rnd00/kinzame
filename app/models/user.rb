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

  def no_loan?
    self.contracts.where(repaid_loan: true).empty?
  end
end
