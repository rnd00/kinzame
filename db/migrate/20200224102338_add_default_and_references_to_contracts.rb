class AddDefaultAndReferencesToContracts < ActiveRecord::Migration[5.2]
  def change
    add_reference :contracts, :user, index: true
    add_reference :contracts, :loan, index: true
    change_column :contracts, :repaid_loan, :boolean, default: false
    change_column :contracts, :repaid_lender, :boolean, default: false
    change_column :contracts, :approved, :boolean, default: false

  end
end
