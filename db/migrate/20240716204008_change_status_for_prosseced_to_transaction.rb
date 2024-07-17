class ChangeStatusForProssecedToTransaction < ActiveRecord::Migration[7.1]
  def change
    rename_column :transactions, :status, :processed
  end
end
