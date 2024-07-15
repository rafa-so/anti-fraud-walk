class CreateMerchant < ActiveRecord::Migration[7.1]
  def change
    create_table :merchants do |t|
      t.integer :identity
      t.boolean :deny, default: false

      t.timestamps
    end
  end
end
