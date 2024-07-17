class AddstatusToTransaction < ActiveRecord::Migration[7.1]
  def change
    add_column :transactions, :status, :boolean, default: false
  end
end
