class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :contracts
  has_many :loans, through: :contracts

  validates :first_name, :last_name, presence: true
  validates :wallet, numericality: { only_integer: true }
end
