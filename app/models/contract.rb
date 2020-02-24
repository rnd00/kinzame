class Contract < ApplicationRecord
  belongs_to :loan
  belongs_to :user

  validates :description, :user_id, :loan_id, presence: true
end
