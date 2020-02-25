class AddDefaultValueToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :wallet, :integer, default: 0
    change_column :users, :lender, :boolean, default: false
  end
end
