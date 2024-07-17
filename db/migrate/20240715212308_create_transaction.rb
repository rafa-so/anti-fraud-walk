class CreateTransaction < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions, id: false do |t|
      t.string :id
      t.datetime :transaction_date, null: false
      t.integer :transaction_amount, null: false
      t.string :card_number, null: false
      t.string :device_id
      t.boolean :chargebacked
      t.timestamps
    end
  end
end
