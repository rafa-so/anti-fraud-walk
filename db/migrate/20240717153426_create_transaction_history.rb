class CreateTransactionHistory < ActiveRecord::Migration[7.1]
  def change
    create_table :transaction_histories do |t|
      t.references :transaction, foreign_key: true
      t.string :external_transaction_id
      t.integer :amount, null: false
      t.string :card_number, null: false
      t.datetime :external_date, null: false
      t.integer :user_id
      t.integer :merchant_id
      t.integer :device_id
      t.boolean :chargebacked
      t.boolean :approved

      t.timestamps
    end
  end
end
