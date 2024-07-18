class CreateTransaction < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.string :external_id
      t.datetime :external_date, null: false
      t.integer :amount, null: false
      t.string :card_number, null: false
      t.string :device_id
      t.integer :user_id
      t.integer :merchant_id
      t.boolean :chargebacked, default: false
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
