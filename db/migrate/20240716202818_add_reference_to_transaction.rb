class AddReferenceToTransaction < ActiveRecord::Migration[7.1]
  def change
    add_reference :transactions, :user
    add_reference :transactions, :merchant
  end
end
