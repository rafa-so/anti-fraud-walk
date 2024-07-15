class CreateMerchant < ActiveRecord::Migration[7.1]
  def change
    create_table :merchants, id: false do |t|
      t.string :id, primary_key: true
      t.boolean :deny, default: false, null: false
      t.timestamps
    end
  end
end
