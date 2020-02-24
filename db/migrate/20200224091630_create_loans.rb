class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.integer :amount
      t.integer :duration
      t.decimal :interest_rate

      t.timestamps
    end
  end
end
