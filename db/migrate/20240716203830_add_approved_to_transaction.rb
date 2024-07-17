class AddApprovedToTransaction < ActiveRecord::Migration[7.1]
  def change
    add_column :transactions, :approved, :boolean, default: false
  end
end
