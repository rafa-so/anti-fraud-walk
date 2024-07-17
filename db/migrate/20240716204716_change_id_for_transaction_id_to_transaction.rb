class ChangeIdForTransactionIdToTransaction < ActiveRecord::Migration[7.1]
  def change
    rename_column :transactions, :id, :transaction_id
  end
end
