class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.text :description
      t.boolean :repaid_loan
      t.boolean :approved
      t.date :due_date
      t.boolean :repaid_lender

      t.timestamps
    end
  end
end
