class ChangeTypesReferencesToTransaction < ActiveRecord::Migration[7.1]
  def change
    change_column(:transactions, :user_id, :string)
    change_column(:transactions, :merchant_id, :string)
  end
end
