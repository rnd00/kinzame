class AddRejectedToContracts < ActiveRecord::Migration[5.2]
  def change
    add_column :contracts, :rejected, :boolean, default: false
  end
end
